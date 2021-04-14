//
//  AboutItem.swift
//  laradiosv
//
//  Created by KYC_Mac on 9/27/19.
//  Copyright © 2019 KYC_Mac. All rights reserved.
//

import UIKit

class AboutItem: NSObject {
    var title = ""
    var desc = ""
    var ico = ""
    
    static func initAboutItem(title: String, desc: String, imgName: String) -> AboutItem {
        let item: AboutItem = AboutItem()
        item.title = title
        item.desc = desc
        item.ico = imgName
        return item
    }
}
