//
//  IMSegmentTitleProperty.swift
//  IMSegmentPageView
//
//  Created by Mazy on 2019/6/26.
//  Copyright © 2019 Mazy. All rights reserved.
//

import UIKit

open class IMSegmentTitleProperty {
    
    public init() {}
    
    /// 是否靠左 默认是 yes
    public var isLeft: Bool = true
    
    /// 滚动Title的字体间距 默认20
    public var itemMargin: CGFloat = 20
    
    /// 标题正常颜色，默认black
    public var titleNormalColor: UIColor = UIColor.black
    
    /// 标题选中颜色，默认red
    public var titleSelectColor: UIColor = UIColor.red
    
    /// 标题字体大小，默认15
    public var titleNormalFont: UIFont = UIFont.systemFont(ofSize: 15)
    
    /// 标题选中字体大小，默认15
    public var titleSelectFont: UIFont = UIFont.systemFont(ofSize: 15)
    
    // 底部指示器
    /// 底部滚动条的颜色 指示器颜色，默认与titleSelectColor一样,在IndicatorTypeNone下无效
    public var indicatorColor: UIColor = UIColor.red
    
    /// 底部滚动条的高度
    public var indicatorHeight: CGFloat = 1
    
    /// 在IndicatorTypeCustom时可自定义此属性，为指示器一端延伸长度，默认5
    /// IndicatorType.width 共用这个属性
    public var indicatorExtension: CGFloat = 0
    
    // 顶部分割线
    /// 底部分割线的高度
    public var bottomLineHeight: CGFloat = 0.5
    
    /// 是否需要底部线
    public var showBottomLine: Bool = false
    
    /// 底部分割线的颜色
    public var bottomLineColor: UIColor = UIColor.lightGray
    /// 指示器类型
    public var indicatorType: IMIndicatorType = .default
}
