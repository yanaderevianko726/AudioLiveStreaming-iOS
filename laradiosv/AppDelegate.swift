//
//  AppDelegate.swift
//  laradiosv
//
//  Created by KYC_Mac on 9/27/19.
//  Copyright © 2019 KYC_Mac. All rights reserved.
//

import UIKit
import AVFoundation
import FRadioPlayer
import MediaPlayer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Thread.sleep(forTimeInterval: 1.0)
        
        UserDefaults.standard.set(apiAudioLinkLow, forKey: "Level")
        UserDefaults.standard.set(0, forKey: "isHighLow")
        // Override point for customization after application launch.
        
        // This will enable to show nowplaying controls on lock screen
        UIApplication.shared.beginReceivingRemoteControlEvents()
        print("receive remoter control")
        
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("audioSession could not be activated")
        }
        
        setupRemoteCommandCenter()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
//        let viewController = window?.rootViewController as! MainViewController
//        viewController.disconnectAVPlayer()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        
//        let viewController = window?.rootViewController as! MainViewController
//        viewController.reconnectAVPlayer()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        UIApplication.shared.endReceivingRemoteControlEvents()
        print("app is terminated")
    }
    
    override func remoteControlReceived(with event: UIEvent?) {
        super.remoteControlReceived(with: event)

        guard let event = event, event.type == .remoteControl else { return }

        switch event.subtype {
        case .remoteControlPlay:
            print("play tapped")
            FRadioPlayer.shared.play()
//            if MainViewController.shared.mediaUB == nil{
//                return
//            }
//            else{
//                MainViewController.stop
//            }
        case .remoteControlPause:
            print("play stop")
            FRadioPlayer.shared.pause()
//            if MainViewController.shared.mediaUB == nil{
//                return
//            }
//            else{
//                MainViewController.shared.mediaUB.setImage(UIImage(named: "img_btn_stop_active"), for: .normal)
//            }
        case .remoteControlTogglePlayPause:
            FRadioPlayer.shared.togglePlaying()
        default:
            break
        }
    }
    
    func setupRemoteCommandCenter() {
        // Get the shared MPRemoteCommandCenter
        let commandCenter = MPRemoteCommandCenter.shared()
        
        // Add handler for Play Command
        commandCenter.playCommand.addTarget { event in
            return .success
        }
        
        // Add handler for Pause Command
        commandCenter.pauseCommand.addTarget { event in
            return .success
        }
        
        // Add handler for Next Command
        commandCenter.nextTrackCommand.addTarget { event in
            return .success
        }
        // Add handler for Previous Command
        commandCenter.previousTrackCommand.addTarget { event in
            return .success
        }
    }
}


