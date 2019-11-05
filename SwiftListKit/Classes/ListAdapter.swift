//
//  ListAdapter.swift
//  FBSnapshotTestCase
//
//  Created by 荣恒 on 2019/11/2.
//

import UIKit

public class ListAdapter<Item: SectionItem>: NSObject,
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout {
    // MARK: - 自有属性
    var sectionMap: SectionMap<Item> = SectionMap()
    
    var _viewSwctionControllerMap: [UICollectionReusableView : ListSectionController<Item>] = [:]
    
    // 注册数组
    var _registeredCellIdentifiers: [String] = []
    var _registeredNibNames: [String] = []
    var _registeredSupplementaryViewIdentifiers: [String] = []
    var _registeredSupplementaryViewNibNames: [String] = []
    
    weak var viewController: UIViewController?
    
    weak var collectionView: UICollectionView? {
        didSet {
            self.collectionView?.dataSource = self
            self.collectionView?.delegate = self
        }
    }
    
    //MARK: 初始化
    public init(collectionView: UICollectionView,
                viewController: UIViewController,
                dataSource: ListAdapterDataSource) {
        self.collectionView = collectionView
        self.viewController = viewController
        self.dataSource = dataSource
    }
    
    deinit {
        self.dataSource = nil
        self.delegate = nil
    }
    
    //MARK: 组合代理属性
    weak var dataSource: ListAdapterDataSource?
    
    weak var delegate: ListAdapterDelegate?
    
    weak var collectionViewDelegate: UICollectionViewDelegate?
    
    weak var scrollViewDelegate: UIScrollViewDelegate?
    
    //MARK: 自有方法
    public func reload(objects: [Item]) {
        
    }
    
    public var visibleSectionControllers: [ListSectionController<Item>] {
        return []
    }
    
    public var visibleObjects: [Item] {
        return []
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - UICollectionViewDataSource
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionMap.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionMap.object(for: section).numberOfItems()
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionController = sectionMap.object(for: indexPath.section)
        let cell = sectionController.cellForItem(at: indexPath.row)
        // cell -> section 做映射
        return cell
    }
    
    
    // MARK: - UICollectionViewDelegate
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        collectionDelegate 代理事件出去
        sectionMap.object(for: indexPath.section).didSelectItem(at: indexPath.item)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        let size = sectionMap.object(for: indexPath.section).sizeForItem(at: indexPath.row)
        let positiveSize = CGSize(width: max(size.width, 0), height: max(size.height, 0))
        
        return positiveSize
    }
        
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionMap.object(for: section).inset
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionMap.object(for: section).minimumLineSpacing
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionMap.object(for: section).minimumInteritemSpacing
    }
        
    //    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    //
    //    }
    //
    //    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    //
    //    }
}
