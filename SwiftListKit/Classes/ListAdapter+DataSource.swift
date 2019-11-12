//
//  ListAdapter+DataSource.swift
//  FBSnapshotTestCase
//
//  Created by 荣恒 on 2019/11/12.
//

import Foundation
import UIKit

final class ListDataSource: NSObject, UICollectionViewDataSource {
    private var sectionMap: SectionMap
    
    init(sectionMap: SectionMap) {
        self.sectionMap = sectionMap
        super.init()
    }
    
    func update(section map: SectionMap) {
        self.sectionMap = map;
    }
    
    
    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionMap.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard sectionMap.count != 0 else {
            return 0
        }
        return sectionMap[section].numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return sectionMap[indexPath.section]
            .cellForItem(at: indexPath.row)
    }
    
}
