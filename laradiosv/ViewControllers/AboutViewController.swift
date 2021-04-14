//
//  AboutViewController.swift
//  laradiosv
//
//  Created by KYC_Mac on 9/27/19.
//  Copyright © 2019 KYC_Mac. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var aboutUTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onClickBackUB(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension AboutViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aboutItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutItemTableViewCell", for: indexPath) as! AboutItemTableViewCell
        
        let item = aboutItems[indexPath.row]
        cell.initWithAboutItem(item: item)
        
        return cell
    }
    
}

extension AboutViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
//        case 6:
//            guard let url = URL(string: apiMoreLink) else { return }
//            UIApplication.shared.open(url)
//            break
        case 4:
            if let appleUrl = URL(string: "https://apps.apple.com/us/app/id") {
                UIApplication.shared.open(appleUrl)
            } else {
                guard let url = URL(string: "market://details?id=\(appBundleID)")  else { return }
                UIApplication.shared.open(url)
            }
            break
//        case 4:
//            let firstActivityItem = "La Radio Sv"
//            let secondActivityItem : NSURL = NSURL(string: //"https://apps.apple.com/us/app/rule-calculator/id1465859570")!
//            // If you want to put an image
//            let image : UIImage = UIImage(named: "radio_logo")!
//
//            let activityViewController : UIActivityViewController = UIActivityViewController(
//                activityItems: [firstActivityItem, secondActivityItem, image], applicationActivities: nil)
//
//            activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 0, height: 0)
//
//            // Anything you want to exclude
//            activityViewController.excludedActivityTypes = [
//                UIActivity.ActivityType.postToWeibo,
//                UIActivity.ActivityType.print,
//                UIActivity.ActivityType.assignToContact,
//                UIActivity.ActivityType.saveToCameraRoll,
//                UIActivity.ActivityType.addToReadingList,
//                UIActivity.ActivityType.postToFlickr,
//                UIActivity.ActivityType.postToVimeo,
//                UIActivity.ActivityType.postToTencentWeibo
//            ]
//
//            self.present(activityViewController, animated: true, completion: nil)
//            break
        default:
            break
        }
    }
    
}
