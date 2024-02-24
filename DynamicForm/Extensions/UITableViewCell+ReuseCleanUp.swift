//
//  UICollectionViewCell+CleanUp.swift
//  DynamicForm
//
//  Created by Oleg Plugaru on 20.02.2024.
//

import UIKit

extension UICollectionViewCell {
    
    /// Removes all content within a cell to help with cleanup
    func removeViews() {
        contentView.subviews.forEach { $0.removeFromSuperview()}
    }
}
