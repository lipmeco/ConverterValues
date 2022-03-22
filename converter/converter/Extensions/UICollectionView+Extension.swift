//
//  UICollectionView+extension.swift
//  converter
//
//  Created by Максим Кузнецов on 17.03.2022.
//

import UIKit

extension UICollectionView {
    func itemSize(itemsCountInRow: Int, itemOffset: CGFloat) -> CGSize {
        let width = ((Int(frame.size.width) - 8 * 2) / itemsCountInRow) - (itemsCountInRow - 1) * Int(itemOffset)
        return CGSize(width: width, height: width)
    }
}
