//
//  AboutItemTableViewCell.swift
//  laradiosv
//
//  Created by KYC_Mac on 9/27/19.
//  Copyright © 2019 KYC_Mac. All rights reserved.
//

import UIKit

class AboutItemTableViewCell: UITableViewCell {

    @IBOutlet weak var icoUIV: UIImageView!
    @IBOutlet weak var titleUL: UILabel!
    @IBOutlet weak var contentUL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initWithAboutItem(item: AboutItem) {
        icoUIV.image = UIImage(named: item.ico)
        titleUL.text = item.title
        contentUL.text = item.desc
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
