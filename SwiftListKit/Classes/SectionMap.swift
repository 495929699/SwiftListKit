//
//  SectionMap.swift
//  FBSnapshotTestCase
//
//  Created by 荣恒 on 2019/11/3.
//

import Foundation

struct SectionMap<Item: SectionItem> {
    var keys: [String] = []
    var objects: [ListSectionController<Item>] = []
    
    var count: Int {
        return keys.count
    }
    
    func object(for section: Int) -> ListSectionController<Item> {
        guard section >= keys.count || section >= objects.count else {
            fatalError("找不到 \(section)下标 对应的ListSectionController")
        }
        return objects[section]
    }
    
    func reset() {
        keys.removeAll()
        objects.removeAll()
    }
    
//    func object<Section: ListSectionType>(for section: Int) -> Section where Section.Item == Item {
//        guard section >= keys.count || section >= objects.count else {
//            fatalError("找不到 \(section)下标 对应的ListSectionController")
//        }
//        return objects[section] as! Section
//    }
    
}
