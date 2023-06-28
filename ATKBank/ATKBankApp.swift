//
//  ATKBankApp.swift
//  ATKBank
//
//  Created by Mert ATK on 22.06.2023.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct ATKBankApp: App {
    

    init(){
        FirebaseApp.configure()
    }
    
    @State private var sessionManeger = SessionManager()
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(sessionManeger)
        }
    }
}
