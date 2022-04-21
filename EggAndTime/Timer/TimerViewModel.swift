//
//  TimerViewModel.swift
//  EggAndTime
//
//  Created by Сашок on 21.04.2022.
//

import Foundation
import AVFoundation

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
        counter / cookingTime
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
    private var eggName: String = ""
    private var donenessName: String = ""
    private var cookingTime: TimeInterval = 0
    
    private var counter: TimeInterval = 0
    private var timer: Timer?
    
    private var timerState: TimerState = .ready
    
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
        resetTimer()
        
        objectWillChange.send()
    }
    
    func buttonTapped() {
        switch timerState {
        case .ready:
            startTimer()
            timerState = .running
        case .running, .done:
            resetTimer()
        }
        
        objectWillChange.send()
    }

    // MARK: - Private methods
    private func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
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
}

// MARK: - Timer state
extension TimerViewModel {
    private enum TimerState {
        case ready
        case running
        case done
    }
}
