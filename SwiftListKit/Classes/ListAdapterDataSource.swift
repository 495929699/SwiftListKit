//
//  ListAdapterDataSource.swift
//  SwiftListKit
//
//  Created by rongheng on 2019/11/5.
//

import Foundation

public protocol ListAdapterDataSource: class {
    func objects<Item: SectionItem>(for listAdapter: ListAdapter<Item>) -> [Item]
    func listAdapter<Item: SectionItem>(_ listAdapter: ListAdapter<Item>, sectionControllerFor object: Item) -> ListSectionController<Item>
    func emptyView<Item: SectionItem>(for listAdapter: ListAdapter<Item>) -> UIView?
}
