//
//  FormContentBuilderImpl.swift
//  DynamicForm
//
//  Created by Oleg Plugaru on 20.02.2024.
//

import Foundation

final class FormContentBuilderImpl {
    var content: [FormSectionComponent] {
        return [
            FormSectionComponent(items: [
                TextFormComponent(placeholder: "First Name"),
                TextFormComponent(placeholder: "Last Name"),
                TextFormComponent(placeholder: "Email",
                                  keyboardType: .emailAddress),
                DateFormComponent(mode: .date),
                ButtonFormComponent(title: "Confirm")
            ])
        ]
    }
}
