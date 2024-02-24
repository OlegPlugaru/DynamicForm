//
//  FormDateCollectionViewCell.swift
//  DynamicForm
//
//  Created by Oleg Plugaru on 20.02.2024.
//

import UIKit
import Combine

class FormDateCollectionViewCell: UICollectionViewCell {
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private lazy var errorLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.systemRed
        lbl.text = " "
        return lbl
    }()
    
    private lazy var contentStackVw: UIStackView = {
        let stackVw = UIStackView()
        stackVw.translatesAutoresizingMaskIntoConstraints = false
        stackVw.axis = .vertical
        stackVw.spacing = 8
        return stackVw
    }()
    
    private var subscription = Set<AnyCancellable>()
    private(set) var subject = PassthroughSubject<(Date, IndexPath), Never>()
    
    private var item: DateFormComponent?
    private var indexPath: IndexPath?
    
    func bind(_ item: FormComponent,
              at indexPath: IndexPath) {
        guard let item = item as? DateFormComponent else { return }
        self.item = item
        self.indexPath = indexPath
        setup(item: item)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        removeViews()
        item = nil
        indexPath = nil
    }
}

private extension FormDateCollectionViewCell {
    func setup(item: DateFormComponent) {
        
        datePicker.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)
        
        datePicker.datePickerMode = .date
        
        contentView.addSubview(contentStackVw)
        
        contentStackVw.addArrangedSubview(datePicker)
        contentStackVw.addArrangedSubview(errorLbl)
        
        NSLayoutConstraint.activate([
            contentStackVw.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentStackVw.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            contentStackVw.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentStackVw.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    @objc func datePickerChanged(picker: UIDatePicker) {
        guard let indexPath = indexPath,
              let item = item else { return }
        let selectedDate = datePicker.date
        self.subject.send((selectedDate, indexPath))
        
        do {
            
            
            for validator in item.validations {
                try validator.validate(selectedDate)
            }
            
            self.errorLbl.text = " "
            
        } catch {
            
            if let validationError = error as? ValidationError {
                switch validationError {
                case .custom(let message):
                    self.errorLbl.text = message
                }
            }
            
            print(error)
        }
    }
}
