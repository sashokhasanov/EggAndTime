//
//  EggAndTimeApp.swift
//  EggAndTime
//
//  Created by Сашок on 20.04.2022.
//

import SwiftUI

@main
struct EggAndTimeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                EggGridView()
            }
            .task {
                do {
                    try await UNUserNotificationCenter.current()
                        .requestAuthorization(options: [.badge, .sound, .alert])
                } catch {
                    print(error)
                }
            }
            .environmentObject(NavigationHelper())
        }
    }
}
