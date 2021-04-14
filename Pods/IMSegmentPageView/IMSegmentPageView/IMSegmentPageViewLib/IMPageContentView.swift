//
//  IMPageContentView.swift
//  IMSegmentPageView
//
//  Created by Mazy on 2019/6/24.
//  Copyright © 2019 Mazy. All rights reserved.
//

import UIKit

/// delagate
public protocol IMPageContentDelegate: NSObjectProtocol {
    
    /// PageContentView滑动调用
    ///
    /// - Parameters:
    ///   - contentView: PageContentView
    ///   - startIndex: 开始滑动页面索引
    ///   - endIndex: 结束滑动页面索引
    ///   - progress: 滑动进度
    func contentViewDidScroll(_ contentView: IMPageContentView, startIndex: Int, endIndex: Int, progress: CGFloat)
    
    /// PageContentView结束滑动
    ///
    /// - Parameters:
    ///   - contentView: PageContentView
    ///   - startIndex: 开始滑动索引
    ///   - endIndex: 结束滑动索引
    func contenViewDidEndDecelerating(_ contentView: IMPageContentView, startIndex: Int, endIndex: Int)
}

// MARK: - optional
public extension IMPageContentDelegate {
    
    /// PageContentView 开始滑动
    func contentViewWillBeginDragging(_ contentView: IMPageContentView) {
        
    }
    
    /// PageContentView 结束拖拽
    func contenViewDidEndDragging(_ contentView: IMPageContentView) {
        
    }
}

open class IMPageContentView: UIView {
    
    /// PageContentDelegate
    public weak var delegate: IMPageContentDelegate?
    /// 设置contentView当前展示的页面索引，默认为0
    public var contentViewCurrentIndex: Int = 0 {
        didSet {
            if contentViewCurrentIndex < 0 || contentViewCurrentIndex > self.childVCs.count - 1 {
                return
            }
            isSelectBtn = true
            self.collectionView.scrollToItem(at: IndexPath(row: contentViewCurrentIndex, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: false)
        }
    }
    /// 设置contentView能否左右滑动，默认YES
    public var contentViewCanScroll: Bool = true {
        didSet {
            collectionView.isScrollEnabled = contentViewCanScroll
        }
    }
    
    private let cellIdentifier = "CollectionCellIdentifier"
    private var parentVC: UIViewController!
    private var childVCs: [UIViewController] = []
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = self.bounds.size
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        return collectionView
    }()
    
    private var startOffsetX: CGFloat = 0
    private var isSelectBtn: Bool = false
    
    public convenience init(Frame: CGRect, childVCs: [UIViewController], parentVC: UIViewController) {
        
        self.init(frame: Frame)
        self.childVCs = childVCs
        self.parentVC = parentVC
        
        setupSubViews()
    }

    private func setupSubViews() {
        
        self.addSubview(collectionView)
        
        self.childVCs.forEach { (childVC) in
            self.parentVC.addChild(childVC)
        }
        
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension IMPageContentView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVCs.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.contentView.subviews.forEach({ $0.removeFromSuperview() })
        let childVC = childVCs[indexPath.row]
        childVC.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVC.view)
    }
}

extension IMPageContentView {

    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isSelectBtn = false
        startOffsetX = scrollView.contentOffset.x
        if let delegate = self.delegate {
            delegate.contentViewWillBeginDragging(self)
        }
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if isSelectBtn {
            return
        }
        
        let scrollViewWidth = scrollView.bounds.width
        let currentOffsetX = scrollView.contentOffset.x
        let startIndex: Int = Int(floor(startOffsetX / scrollViewWidth))
        var endIndex: Int
        var pregress: CGFloat
        
        if currentOffsetX > startOffsetX { //左滑left
            pregress = (currentOffsetX - startOffsetX) / scrollViewWidth
            endIndex = startIndex + 1
            if endIndex > self.childVCs.count - 1 {
                endIndex = self.childVCs.count - 1
            }
        } else if currentOffsetX == startOffsetX { //没滑过去
            pregress = 0
            endIndex = startIndex
        } else { //右滑right
            pregress = (startOffsetX - currentOffsetX) / scrollViewWidth
            endIndex = startIndex - 1
            endIndex = endIndex < 0 ? 0 : endIndex
        }
        
        self.delegate?.contentViewDidScroll(self, startIndex: startIndex, endIndex: endIndex, progress: pregress)
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let scrollViewWidth = scrollView.bounds.width
        let currentOffsetX = scrollView.contentOffset.x
        let startIndex = Int(floor(startOffsetX / scrollViewWidth))
        let endIndex = Int(floor(currentOffsetX / scrollViewWidth))
        delegate?.contenViewDidEndDecelerating(self, startIndex: startIndex, endIndex: endIndex)
    }
    
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        delegate?.contenViewDidEndDragging(self)
    }
}
