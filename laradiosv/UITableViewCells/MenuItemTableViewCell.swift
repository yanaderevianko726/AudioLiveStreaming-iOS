//
//  MenuItemTableViewCell.swift
//  laradiosv
//
//  Created by KYC_Mac on 9/27/19.
//  Copyright © 2019 KYC_Mac. All rights reserved.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainUV: UIView!
    @IBOutlet weak var icoUIV: UIImageView!
    @IBOutlet weak var titleUL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initWithMenuItem(item: MenuItem) {
        if item.isSelected {
            icoUIV.image = UIImage(named: item.ico)
            mainUV.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.10)
            titleUL.textColor = UIColor(named: "main_bar")
        } else {
            icoUIV.image = UIImage(named: item.ico_in)
            mainUV.backgroundColor = UIColor.white
            titleUL.textColor = UIColor.black
        }
        titleUL.text = item.title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
