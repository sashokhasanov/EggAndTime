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
        return timeFormatter.string(from: counter) ?? "00:00:00"
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
    
    var isRunning: Bool {
        timerState == .running
    }
    
    // MARK: - Private properties
    private let notificationId = Bundle.main.bundleIdentifier ?? "ru.awesome.EggAndTime"
    
    private var eggName: String = ""
    private var donenessName: String = ""
    private var cookingTime: TimeInterval = 0
    
    private var timerState: TimerState = .ready
    private var counter: TimeInterval {
        max(0, cookingTime - elapsedTime)
    }
    private var timer: Timer?
    
    private var startTime = TimeInterval()
    private var elapsedTime = TimeInterval()
    
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
        guard cookingTime > 0 else {
            return
        }
        
        startTime = Date.timeIntervalSinceReferenceDate
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateCounter),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    private func resetTimer() {
        stopTimer()
        elapsedTime = 0
        timerState = .ready
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func updateCounter() {
        elapsedTime = (Date.timeIntervalSinceReferenceDate - startTime).rounded()
        
        if elapsedTime >= cookingTime {
            stopTimer()
            timerState = .done
        }
        
        objectWillChange.send()
    }
    
    private func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Ко-ко-ко!"
        content.body = "Яйцо сварилось"
        content.sound = UNNotificationSound(named: UNNotificationSoundName("Rooster-Crow.mp3"))
        
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
