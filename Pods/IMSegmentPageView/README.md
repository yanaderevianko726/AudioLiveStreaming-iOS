# SegmentPageView
This is a segment titleView and pageView menu.

IMSegmentPageView is a Swift library that provides a customizable segment titleView and pageView menu.

![image](https://github.com/iMazy/IMSegmentPageView/blob/master/IMSegmentPageView/iphonexspacegrey_landscape.png)

## Requirements

- iOS 9.0+
- Swift 4.2+

## Installation

Drop in the Classes folder to your Xcode project.  

#### Using [Cocoapods](http://cocoapods.org/)

Add `pod 'IMSegmentPageView'` to your `Podfile` and run `pod install`. Also add `use_frameworks!` to the `Podfile`.

```
use_frameworks!

pod 'IMSegmentPageView'
```

#### Using [Carthage](https://github.com/Carthage/Carthage)

Add `github "iMazy/IMSegmentPageView"` to your `Cartfile` and run `carthage update`. If unfamiliar with Carthage then checkout their [Getting Started section](https://github.com/Carthage/Carthage#getting-started).

```
github "iMazy/IMSegmentPageView"
```

## IMSegmentPageView Usage
Import IMSegmentPageView

```import IMSegmentPageView``` then use the following codes in some function except for viewDidLoad.  

#### Add segment title view
```
 let property = IMSegmentTitleProperty()
 property.indicatorHeight = 3
 property.indicatorType = .width
 property.isLeft = false
 property.showBottomLine = true
 let titles = ["首页", "电影", "影院", "演出", "MV", "榜单", "热点", "商城"]
 let titleFrame = CGRect.zero # set what you need
 let titleView = IMSegmentTitleView(frame: titleFrame, titles: titles, property: property)
 titleView.delegate = self # if need, you should implement delegate methods
 view.addSubview(titleView)
```

#### Add a pageView view with controllers
```
var childVCs: [UIViewController] = [] // viewControllers
let contentFrame = CGRect.zero # set what you need
let pageView = IMPageContentView(Frame: contentFrame, childVCs: childVCs, parentVC: self)
pageView.delegate = self # if need, you should implement delegate methods
view.addSubview(pageView!)
```

## Author
iMazy  
 [http://imazy.cn](http://imazy.cn)
 
## Feedback
Your can feedback me with email mazy_ios@163.com
 
## License
XMAlertSheetController is released under the MIT license.  
See LICENSE for details.
