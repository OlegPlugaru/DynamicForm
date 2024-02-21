//
//  FormContentBuilderImpl.swift
//  DynamicForm
//
//  Created by Oleg Plugaru on 20.02.2024.
//

import Foundation

final class FormContentBuilderImpl {
    private(set) var formContent = [
        FormSectionComponent(items: [
            TextFormComponent(id: .firstName, placeholder: "First Name"),
            TextFormComponent(id: .lastName, placeholder: "Last Name"),
            TextFormComponent(id: .email, placeholder: "Email",
                              keyboardType: .emailAddress),
            DateFormComponent(id: .dob, mode: .date),
            ButtonFormComponent(id: .submit, title: "Confirm")
        ])
    ]
}
