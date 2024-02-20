//
//  UICollectionViewCell+CleanUp.swift
//  DynamicForm
//
//  Created by Oleg Plugaru on 20.02.2024.
//

import UIKit

extension UICollectionViewCell {
    func removeViews() {
        contentView.subviews.forEach { $0.removeFromSuperview()}
    }
}
