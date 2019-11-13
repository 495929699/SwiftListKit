//
//  ListAdapter.swift
//  FBSnapshotTestCase
//
//  Created by 荣恒 on 2019/11/2.
//

import UIKit

public class ListAdapter {
    
    public weak var collectionView: UICollectionView? {
        didSet {
            self.collectionView?.dataSource = self._collectionDataSource
            self.collectionView?.delegate = self._collectionDelegate
        }
    }
    
    //MARK: 组合代理属性
    public weak var dataSource: ListAdapterDataSource?
    public weak var delegate: ListAdapterDelegate?
    
    public weak var viewController: UIViewController?
    
    
    // MARK: - 自有属性
    var sectionMap: ListSectionMap = ListSectionMap()
    
    var _viewSwctionControllerMap: [UICollectionReusableView : ListSectionController] = [:]
    
    // MARK: - Collection DataSourece & Delegate
    var _collectionDataSource: ListDataSource
    var _collectionDelegate: ListDelegate
    
    // 注册数组
    var _registeredCellIdentifiers: [String] = []
    var _registeredNibNames: [String] = []
    var _registeredSupplementaryViewIdentifiers: [String] = []
    var _registeredSupplementaryViewNibNames: [String] = []
    
    
    //MARK: 初始化
    public init(collectionView: UICollectionView,
                viewController: UIViewController,
                dataSource: ListAdapterDataSource) {
        self.collectionView = collectionView
        self.viewController = viewController
        self.dataSource = dataSource
        
        _collectionDataSource = ListDataSource(sectionMap: sectionMap)
        _collectionDelegate = ListDelegate(sectionMap: sectionMap)
    }
    
    deinit {
        self.dataSource = nil
        self.delegate = nil
    }
    
    
    
    //MARK: 自有方法
    public func reload<Item>(for items: [Item]) {
        
    }
    
    public var visibleSectionControllers: [ListSectionController] {
        return []
    }
    
    public func visibleItems<Item>() -> [Item] {
        return []
    }
    
//    public var visibleObjects: [Item] {
//        return []
//    }

}


extension  ListAdapter {
    
    func updateSectionMap(_ map: ListSectionMap) {
        // 可加入串行队列，防止多线程时出错
        sectionMap = map
        _collectionDataSource.update(section: map)
        _collectionDelegate.update(section: map)
    }
    
}
