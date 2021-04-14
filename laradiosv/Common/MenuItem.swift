//
//  MenuItem.swift
//  laradiosv
//
//  Created by KYC_Mac on 9/27/19.
//  Copyright © 2019 KYC_Mac. All rights reserved.
//

import UIKit

class MenuItem: NSObject {
    var title = ""
    var ico_in = ""
    var ico = ""
    var isSelected = false
    
    static func initMenuItem(title: String, imgName: String) -> MenuItem {
        let item: MenuItem = MenuItem()
        item.title = title
        item.ico = imgName
        item.ico_in = "\(imgName)_in"
        item.isSelected = false
        return item
    }
}
