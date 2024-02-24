//
//  UICollectionView+Identifier.swift
//  DynamicForm
//
//  Created by Oleg Plugaru on 20.02.2024.
//

import UIKit

extension UICollectionViewCell {
    
    static var cellId: String {
        String(describing: self)
    }
}
