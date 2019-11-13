//
//  ListAdapterDataSource.swift
//  SwiftListKit
//
//  Created by rongheng on 2019/11/5.
//

import Foundation

// MARK: - ListAdapterDataSource
public protocol ListAdapterDataSource: class {
    func objects<Item: SectionItem>(for listAdapter: ListAdapter) -> [Item]
    func listAdapter<Item: SectionItem>(_ listAdapter: ListAdapter, sectionControllerFor object: Item) -> ListSectionController
    func emptyView(for listAdapter: ListAdapter) -> UIView?
}


// MARK: - ListAdapterDelegate
public protocol ListAdapterDelegate: class {
    func listAdapter<Item: SectionItem>(_ listAdapter: ListAdapter, willDisplay object: Item, at index: Int)
    func listAdapter<Item: SectionItem>(_ listAdapter: ListAdapter, didEndDisplay object: Item, at index: Int)
}
