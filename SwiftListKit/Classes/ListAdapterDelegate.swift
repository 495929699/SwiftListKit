//
//  ListAdapterDelegate.swift
//  SwiftListKit
//
//  Created by rongheng on 2019/11/5.
//

import Foundation

public protocol ListAdapterDelegate: class {
    func listAdapter<Item: SectionItem>(_ listAdapter: ListAdapter<Item>, willDisplay object: Item, at index: Int)
    func listAdapter<Item: SectionItem>(_ listAdapter: ListAdapter<Item>, didEndDisplay object: Item, at index: Int)
}
