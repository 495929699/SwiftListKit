//
//  ListAdapter+UICollectionView.swift
//  FBSnapshotTestCase
//
//  Created by 荣恒 on 2019/11/2.
//

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



final class ListDelegate: NSObject,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout {
    
    private var sectionMap: SectionMap
    
    init(sectionMap: SectionMap) {
        self.sectionMap = sectionMap
        super.init()
    }
    
    func update(section map: SectionMap) {
        self.sectionMap = map;
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      //        collectionDelegate 代理事件出去
        sectionMap[indexPath.section]
            .didSelectItem(at: indexPath.item)
    }
      
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
          
    }
      
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
          
    }
      
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
          
    }
      
      // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = sectionMap[indexPath.section]
            .sizeForItem(at: indexPath.row)
        let positiveSize = CGSize(
            width: max(size.width, 0),
            height: max(size.height, 0)
        )
        return positiveSize
    }
          
      public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
          return sectionMap[section].inset
      }
      
      public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          return sectionMap[section].minimumLineSpacing
      }
      
      public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          return sectionMap[section].minimumInteritemSpacing
      }
    
    //    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    //
    //    }
    //
    //    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    //
    //    }
    
}
