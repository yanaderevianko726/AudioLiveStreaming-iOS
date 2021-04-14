//
//  TwitterViewController.swift
//  laradiosv
//
//  Created by KYC_Mac on 9/28/19.
//  Copyright © 2019 KYC_Mac. All rights reserved.
//

import UIKit

class TwitterViewController: UIViewController {
    
    @IBOutlet weak var webUWV: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUIView()
    }
    
    func initUIView() {
        let url = URL(string: apiTwitterLink)
        let request = URLRequest(url: url!)
        webUWV.loadRequest(request)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
