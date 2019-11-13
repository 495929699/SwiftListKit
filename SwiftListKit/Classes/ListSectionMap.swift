//
//  SectionMap.swift
//  FBSnapshotTestCase
//
//  Created by 荣恒 on 2019/11/3.
//

import Foundation

struct ListSectionMap {
    var keys: [String] = []
    var objects: [ListSectionController] = []
    
    var count: Int {
        return keys.count
    }
    
    mutating func reset() {
        keys.removeAll()
        objects.removeAll()
    }
    
    subscript(index: Int) -> ListSectionController {
        guard index >= keys.count || index >= objects.count
            else {
              fatalError("找不到 \(index)下标 对应的ListSectionController")
        }
        return objects[index]
    }
    
}
