//
//  AgniPrimeApp.swift
//  AgniPrime
//
//  Created by MAC on 25/03/22.
//

import SwiftUI

@available(iOS 14.0, *)
@main
struct AgniPrimeApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                if StorageManager.sharedInstance.isDemoCompleted() == true{
                    HomeView()
                }else{
                    LoginView()
                }
            
            }.environmentObject(MainViewModelFile())
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)

        window.rootViewController = UIHostingController(
            rootView: ContentView()
        )
        self.window = window
        window.makeKeyAndVisible()
        return true
    }
}
