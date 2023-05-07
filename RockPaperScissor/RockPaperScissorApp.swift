//
//  RockPaperScissorApp.swift
//  RockPaperScissor
//
//  Created by Dara Adekore on 2023-04-22.
//

import SwiftUI
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
@main
struct RockPaperScissorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init(){
        AppCenter.start(withAppSecret: "afffe0c9-a5b0-4e89-8f0b-30c87698c151", services:[
          Analytics.self,
          Crashes.self
        ])
    }
}
