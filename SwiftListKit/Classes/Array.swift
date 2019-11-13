//
//  Array.swift
//  FBSnapshotTestCase
//
//  Created by rongheng on 2019/11/13.
//

import Foundation

extension Array where Element: Hashable {
    /// 去重
    func unique() -> [Element] {
        var uniq = Set<Element>()
        uniq.reserveCapacity(self.count)
        return self.filter {
            return uniq.insert($0).inserted
        }
    }
}
