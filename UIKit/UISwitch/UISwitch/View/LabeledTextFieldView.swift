//
//  LabelAndTextFieldView.swift
//  UISwitch
//
//  Created by Дарья Литвинова on 14.10.2025.
//

import UIKit

class LabeledTextFieldView: UIView {

    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .pinkAccent
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var textField: UnderlinedTextField = {
        let textField = UnderlinedTextField()
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    init(labelText: String, textFieldPlaceholder: String? = nil) {
        super.init(frame: .zero)
        
        setupUI()
        
        label.text = labelText
        if let textFieldPlaceholder = textFieldPlaceholder {
            textField.placeholder = textFieldPlaceholder
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension LabeledTextFieldView {
    func setupUI() {
        self.backgroundColor = .systemBackground
        self.translatesAutoresizingMaskIntoConstraints = false
        
        [label, textField].forEach {
            self.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
