//
//  TimerViewModel.swift
//  EggAndTime
//
//  Created by Сашок on 21.04.2022.
//

import AVFoundation
import UserNotifications

class TimerViewModel: ObservableObject {
    // MARK: - Internal properties
    var eggNameText: String {
        "Яйцо: \(eggName)"
    }
    
    var donenessText: String {
        "Готовим: \(donenessName)"
    }
    
    var timerText: String {
        timeFormatter.string(from: counter) ?? "00:00:00"
    }
    
    var progress: Double {
        cookingTime == 0 ? 1 : counter / cookingTime
    }
    
    var buttonTitle: String {
        switch timerState {
        case .ready:
            return "Запустить"
        case .running:
            return "Сбросить"
        case .done:
            return "Еще раз"
        }
    }
    
    // MARK: - Private properties
    private let notificationId = Bundle.main.bundleIdentifier ?? "ru.awesome.EggAndTime"
    
    private var eggName: String = ""
    private var donenessName: String = ""
    private var cookingTime: TimeInterval = 0
    
    private var timerState: TimerState = .ready
    private var counter: TimeInterval = 0
    private var timer: Timer?
    
    lazy private var timeFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = [.pad]
        return formatter
    }()
    
    // MARK: - Internal methods
    func fetchData(eggName: String, donenessName: String) async {
        self.eggName = eggName
        self.donenessName = donenessName
        
        self.cookingTime = EggStore.doneness[eggName]?.first{ $0.name == donenessName }?.cookingTime ?? 0
        self.counter = self.cookingTime
        
        objectWillChange.send()
    }
    
    func buttonTapped() {
        switch timerState {
        case .ready:
            startTimer()
            scheduleNotification()
            timerState = .running
        case .running:
            removeScheduledNotification()
            fallthrough
        case .done:
            resetTimer()
        }
        
        objectWillChange.send()
    }

    // MARK: - Private methods
    private func startTimer() {
        guard counter > 0 else {
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateCounter),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    private func resetTimer() {
        killTimer()
        counter = cookingTime
        timerState = .ready
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            AudioServicesPlayAlertSound(SystemSoundID(1304))
            killTimer()
            timerState = .done
        }
        
        objectWillChange.send()
    }
    
    private func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Ко-ко-ко!"
        content.body = "Яйцо сварилось"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: cookingTime, repeats: false)
        let req = UNNotificationRequest(identifier: notificationId, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
    }
    
    private func removeScheduledNotification() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [notificationId])
    }
}

// MARK: - Timer state
extension TimerViewModel {
    private enum TimerState {
        case ready
        case running
        case done
    }
}
