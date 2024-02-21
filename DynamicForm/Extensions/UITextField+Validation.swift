//
//  UITextField+Validation.swift
//  DynamicForm
//
//  Created by Oleg Plugaru on 21.02.2024.
//

import UIKit
extension UITextField {
    
    /// Hightlights a textfield in green to show that it's valid
    func valid() {
        self.layer.borderColor = UIColor.systemGreen.cgColor
    }
    
    /// Highlights a textfield in red to show that it's invalid
    func invalid() {
        self.layer.borderColor = UIColor.systemRed.cgColor
    }
}



