//
//  ValidationError .swift
//  DynamicForm
//
//  Created by Oleg Plugaru on 24.02.2024.
//

import Foundation

enum ValidationError: Error {
    case custom(message: String)
}
