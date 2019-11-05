//
//  ListSectionController.swift
//  FBSnapshotTestCase
//
//  Created by 荣恒 on 2019/11/2.
//

import Foundation
import UIKit

public protocol ListCollectionContext: class {
    
}

public protocol ListScrollDelegate: class {
    
}

public protocol SectionItem {
    
}

public protocol ListSectionType {
    associatedtype Item: SectionItem
    
    var section: UInt { get }
    var isFirstSection: Bool { get }
    var isLastSection: Bool { get }
    var inset: UIEdgeInsets { get }
    var minimumLineSpacing: CGFloat { get }
    var minimumInteritemSpacing: CGFloat { get }
    
    var viewController: UIViewController { get }
    var collectionContext: ListCollectionContext? { get }
    
    var scrollDegate: ListScrollDelegate? { get }
    
    func numberOfItems() -> Int
    func sizeForItem(at index: Int) -> CGSize
    func cellForItem(at index: Int) -> UICollectionViewCell
    func didUpdate<Item>(to object: Item)
    func didSelectItem(at index: Int)
}

extension ListSectionType {
    public var section: UInt {
        return 0;
    }
    public var isFirstSection: Bool {
        return true
    }
    public var isLastSection: Bool {
        return true
    }
    public var inset: UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    public var minimumLineSpacing: CGFloat {
        return 0;
    }
    public var minimumInteritemSpacing: CGFloat {
        return 0;
    }
    
    
    public func didSelectItem(at index: Int) {
        
    }
    
}

public class ListSectionController<Item: SectionItem>: ListSectionType {
    public typealias Item = Item
    
    public var viewController: UIViewController
    
    public var collectionContext: ListCollectionContext?
    
    public var scrollDegate: ListScrollDelegate?
    
    public func didUpdate<Item>(to object: Item) {
        
    }
    
    public func numberOfItems() -> Int {
        fatalError("子类重写numberOfItems")
    }
    
    public func sizeForItem(at index: Int) -> CGSize {
        fatalError("子类重写sizeForItem")
    }
    
    public func cellForItem(at index: Int) -> UICollectionViewCell {
        fatalError("子类重写sizeForItem")
    }
    
    init() {
        self.viewController = UIViewController()
    }

}
