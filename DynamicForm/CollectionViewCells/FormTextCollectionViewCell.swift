//
//  FormTextCollectionViewCell.swift
//  DynamicForm
//
//  Created by Oleg Plugaru on 20.02.2024.
//

import UIKit

class FormTextCollectionViewCell: UICollectionViewCell {
    
    private lazy var txtField: UITextField = {
        
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.layer.cornerRadius = 8
        txtField.layer.borderWidth = 1
        txtField.layer.borderColor = UIColor.systemGray5.cgColor
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        txtField.leftView = paddingView
        txtField.leftViewMode = .always
        return txtField
    }()
    
    func bind(_ item: FormComponent) {
        guard let item = item as? TextFormComponent else { return }
        setup(item: item)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        removeViews()
    }
}

private extension FormTextCollectionViewCell {
    func setup(item: TextFormComponent) {
        txtField.placeholder = "\(item.placeholder)"
        txtField.keyboardType = item.keyboardType
        
        // Layout
        
        contentView.addSubview(txtField)
        
        NSLayoutConstraint.activate([
            txtField.heightAnchor.constraint(equalToConstant: 44),
            txtField.topAnchor.constraint(equalTo: contentView.topAnchor),
            txtField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            txtField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            txtField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
