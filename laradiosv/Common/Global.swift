//
//  Global.swift
//  laradiosv
//
//  Created by KYC_Mac on 9/27/19.
//  Copyright © 2019 KYC_Mac. All rights reserved.
//

import UIKit

var menuItems: [MenuItem] = [
    MenuItem.initMenuItem(title: "Hjem", imgName: "ico_home"),
//    MenuItem.initMenuItem(title: "Social", imgName: "ico_social"),
    MenuItem.initMenuItem(title: "Vurder", imgName: "ico_rate"),
    MenuItem.initMenuItem(title: "Om PartyFM", imgName: "ico_about"),
    MenuItem.initMenuItem(title: "Afslut", imgName: "ico_power_off")
]

var aboutItems: [AboutItem] = [
    AboutItem.initAboutItem(title: "Program navn", desc: "ParytyFM", imgName: "ico_about_name"),
    AboutItem.initAboutItem(title: "Build Version", desc: "Version 1.0", imgName: "ico_about_version"),
    AboutItem.initAboutItem(title: "Email", desc: "partyfm@partyfm.dk", imgName: "ico_about_email"),
    AboutItem.initAboutItem(title: "Copyright", desc: "Musikken er stillet til rådighed med tilladelse fra Koda & Gramex.", imgName: "ico_about_copy"),
//    AboutItem.initAboutItem(title: "Share", desc: "Share to your friends", imgName: "ico_about_share"),
    AboutItem.initAboutItem(title: "Bedøm", desc: "Bedøm denne app", imgName: "ico_about_rate"),
//    AboutItem.initAboutItem(title: "More", desc: "Want to request a song?", imgName: "ico_about_more")
]

let apiMoreLink = "https://facebook.com/La-Radio-SV-109830723742396"
let apiFacebookLink = "http://m.partyfm.dk/"
let apiTwitterLink = "http://twitter.com/LaRadioSV1"
//let apiAudioLink = "https://patmos.cdnstream.com:2199/tunein/laradiosv.asx"
//http://192.111.140.6:9779/stream
//http://192.111.140.6:9545/live
let apiAudioLink = "http://192.111.140.6:9545/live"
let apiAudioLinkLow = "http://stream.partyfm.dk/Party64mobil"
let apiAudioLinkHigh = "http://stream.partyfm.dk/Party128mobil"
let appBundleID = "com.firecast.partyfmdk"

class Global: NSObject {
    
    static func onMoveAnimationUIView(view: UIView, moveSpace value: CGFloat, direction isX: Bool = false, during time: Double = 0.3, success: @escaping (() -> Void)) {
        UIView.animate(withDuration: time, animations: {
            if isX {
                view.frame.origin.x += value
            } else {
                view.frame.origin.y += value
            }
        }, completion: {
            (value: Bool) in
            success()
        })
    }
    
    static func onFadeAnimationUIView(view: UIView, direction isShow: Bool = false, during time: Double = 0.3) {
        UIView.animate(withDuration: time, animations: {
            if isShow {
                view.isUserInteractionEnabled = true
                view.alpha = 1.0
            } else {
                view.isUserInteractionEnabled = false
                view.alpha = 0.0
            }
        }, completion: nil)
    }
    
}
