//
//  AppDelegate.swift
//  SportsTeamAssessment
//
//  Created by iMac Pro on 2/8/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        //MARK: - MOCK DATA
        TeamController.sharedInstance.createTeam(teamName: "Dallas Cowboys", playerCount: 53, teamRanking: 32)
        TeamController.sharedInstance.createTeam(teamName: "Dallas Mavs", playerCount: 17, teamRanking: 6)
        TeamController.sharedInstance.createTeam(teamName: "Dallas Stars", playerCount: 24, teamRanking: 1)
        TeamController.sharedInstance.createTeam(teamName: "Texas Rangers", playerCount: 40, teamRanking: 30)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

