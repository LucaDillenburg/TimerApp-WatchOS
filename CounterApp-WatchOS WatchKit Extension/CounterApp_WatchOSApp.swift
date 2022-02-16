//
//  CounterApp_WatchOSApp.swift
//  CounterApp-WatchOS WatchKit Extension
//
//  Created by Luca Dillenburg on 15/02/22.
//

import SwiftUI

@main
struct CounterApp_WatchOSApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
