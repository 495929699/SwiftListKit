//
//  ListAdapter.swift
//  FBSnapshotTestCase
//
//  Created by 荣恒 on 2019/11/2.
//

import UIKit

final public class ListAdapter {
    
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
    var sectionMap: ListSectionMap = ListSectionMap() {
        didSet {
            _collectionDataSource.update(section: sectionMap)
            _collectionDelegate.update(section: sectionMap)
        }
    }
    
    var _viewSwctionControllerMap: [UICollectionReusableView : ListSectionController] = [:]
    
    // MARK: - Collection DataSourece & Delegate
    var _collectionDataSource: ListDataSource
    var _collectionDelegate: ListDelegate
    
    /// 更新CollectionView的对象
    var _updater: ListAdpterUpdater
    
    // 注册数组
    var _registeredCellIdentifiers: [String] = []
    var _registeredNibNames: [String] = []
    var _registeredSupplementaryViewIdentifiers: [String] = []
    var _registeredSupplementaryViewNibNames: [String] = []
    
    
    //MARK: 初始化
    public init(collectionView: UICollectionView,
                viewController: UIViewController,
                dataSource: ListAdapterDataSource,
                updater: ListAdpterUpdater = ListAdpterUpdater()) {
        self.collectionView = collectionView
        self.viewController = viewController
        self.dataSource = dataSource
        self._updater = updater
        
        _collectionDataSource = ListDataSource(sectionMap: sectionMap)
        _collectionDelegate = ListDelegate(sectionMap: sectionMap)
    }
    
    deinit {
        self.dataSource = nil
        self.delegate = nil
    }
    
    
    
    //MARK: 自有方法
    
    public var visibleSectionControllers: [ListSectionController] {
        return []
    }
    
    public func visibleItems<Item>() -> [Item] {
        return []
    }
    
//    public var visibleObjects: [Item] {
//        return []
//    }
    
    
    func _updateAfterPublicSettingsChange() {
        guard
            let uniqueObjects = dataSource?.objects(for: self),
            !uniqueObjects.isEmpty,
            let dataSource = self.dataSource
        else { return }
        
        let sectionControllers = uniqueObjects.map(sectionController(_:)).compactMap { $0 }
        
        let updatedObjects = uniqueObjects.filter(<#T##isIncluded: (ListDiffable) throws -> Bool##(ListDiffable) throws -> Bool#>)
//        let (validObjects,sectionControllers) =
//            uniqueObjects
//                .map(configureSection(for:))
//                .compactMap { $0 }.reduce([]) { (<#Result#>, <#(ListDiffable, ListSectionController)#>) -> Result in
//                    <#code#>
//        }
        
    }
    
    func sectionController(_ diff: ListDiffable) -> ListSectionController? {
        var sectionController = sectionMap[diff]
        if sectionController == nil {
            sectionController = self.dataSource?.listAdapter(self, sectionControllerFor: diff)
        }
        assert(sectionController == nil, "\(diff) 对应的sectionController 不存在")
        return sectionController
    }
    
    func isUpdateObject(_ diff: ListDiffable) -> Bool {
        let isContains = sectionMap.contains(diff)
        if let diffSection = sectionMap.section(for: diff) {
            let value = sectionMap[diffSection]
        }
        
    }
    
    func configureSection(for diff: ListDiffable) -> (ListDiffable, ListSectionController)? {
        var sectionController = sectionMap[diff]
        if sectionController == nil {
            sectionController = dataSource?.listAdapter(self, sectionControllerFor: diff)
        }
        guard var section = sectionController else {
            assertionFailure("\(dataSource) 找不到 \(diff)对应的 sectionController")
            return nil
        }
        
        section.viewController = self.viewController
        section.collectionContext = self
        
        guard sectionMap.contains(diff) else {
            return nil
        }
        return (diff, section)
    }

}


extension ListAdapter {
    
    
}

extension ListAdapter: ListCollectionContext {
    
    
}
