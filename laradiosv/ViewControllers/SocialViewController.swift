//
//  SocialViewController.swift
//  laradiosv
//
//  Created by KYC_Mac on 9/27/19.
//  Copyright © 2019 KYC_Mac. All rights reserved.
//

import UIKit
import IMSegmentPageView

class SocialViewController: UIViewController {

    @IBOutlet weak var contentUV: UIView!
    
    var titleView: IMSegmentTitleView?
    var pageView: IMPageContentView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUIView()
    }
    
    func initUIView() {
        let property = IMSegmentTitleProperty()
        property.indicatorHeight = 3
        property.indicatorType = .width
        property.indicatorColor = UIColor.white
        property.indicatorExtension = contentUV.frame.width / 2.0 - 10.0
        property.isLeft = false
        property.showBottomLine = true
        property.titleNormalColor = UIColor.black
        property.titleSelectColor = UIColor.white
        property.titleNormalFont = UIFont(name:"HelveticaNeue", size: 16.0)!
        property.titleSelectFont = UIFont(name:"HelveticaNeue", size: 16.0)!
        
        let titles = ["m.partyfm.dk"]
        let titleFrame = CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: 60.0)
        titleView = IMSegmentTitleView(frame: titleFrame, titles: titles, property: property)
        titleView!.backgroundColor = UIColor(named: "mainBgColor")
        titleView!.delegate = self
        contentUV.addSubview(titleView!)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc1 = storyboard.instantiateViewController(withIdentifier: "FacebookViewController") as! FacebookViewController
//        let vc2 = storyboard.instantiateViewController(withIdentifier: "TwitterViewController") as! TwitterViewController
        
        let childVCs: [UIViewController] = [vc1] // viewControllers
        let contentFrame = CGRect(x: 0.0, y: 60.0, width: contentUV.bounds.size.width, height: contentUV.bounds.size.height - 60.0)
        vc1.preferredContentSize = contentFrame.size
//        vc2.preferredContentSize = contentFrame.size
        pageView = IMPageContentView(Frame: contentFrame, childVCs: childVCs, parentVC: self)
        pageView?.delegate = self
        contentUV.addSubview(pageView!)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func onClickBackUB(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension SocialViewController: IMPageContentDelegate {
    
    func contentViewDidScroll(_ contentView: IMPageContentView, startIndex: Int, endIndex: Int, progress: CGFloat) {
        //
    }
    
    func contenViewDidEndDecelerating(_ contentView: IMPageContentView, startIndex: Int, endIndex: Int) {
        titleView?.selectIndex = endIndex
    }
    
}

extension SocialViewController: IMSegmentTitleViewDelegate {
    
    func segmentTitleView(_ titleView: IMSegmentTitleView, startIndex: Int, endIndex: Int) {
        pageView?.contentViewCurrentIndex = endIndex
    }
    
}
