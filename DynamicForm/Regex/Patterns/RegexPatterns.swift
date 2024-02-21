//
//  RegexPatterns.swift
//  DynamicForm
//
//  Created by Oleg Plugaru on 21.02.2024.
//

import Foundation

// Patterns to validate content

enum RegexPatterns {
    static let emailChars = ".*[@].*"
    static let higherThanSixChars = "^.{6,}$"
    static let name = "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
}
