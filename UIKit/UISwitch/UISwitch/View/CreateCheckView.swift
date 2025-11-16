//
//  CreateCheckView.swift
//  UISwitch
//
//  Created by Дарья Литвинова on 14.10.2025.
//

import UIKit

class CreateCheckView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cafe Mario"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    lazy var nameLabeledTextField: LabeledTextFieldView = {
        let view = LabeledTextFieldView(labelText: "ФИО", textFieldPlaceholder: "Введите ФИО")
        
        return view
    }()
    
    lazy var guestLabeledTextField: LabeledTextFieldView = {
        let view = LabeledTextFieldView(labelText: "Количество гостей", textFieldPlaceholder: "Введите количество")
        
        return view
    }()
    
    lazy var tableLabeledTextField: LabeledTextFieldView = {
        let view = LabeledTextFieldView(labelText: "Номер стола", textFieldPlaceholder: "Введите номер")
        
        return view
    }()
    
    lazy var bookingSwitch: LabeledSwitch = {
        let switchControl = LabeledSwitch(text: "Бронировали стол?")
        
        return switchControl
    }()
    
    lazy var prepaySwitch: LabeledSwitch = {
        let switchControl = LabeledSwitch(text: "Предоплата?")
        
        return switchControl
    }()
    
    lazy var vipSwitch: LabeledSwitch = {
        let switchControl = LabeledSwitch(text: "VIP комната?")
        
        return switchControl
    }()
    
    lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выставить счет", for: .normal)
        button.backgroundColor = .pinkAccent
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension CreateCheckView {
    func setupUI() {
        self.backgroundColor = .systemBackground
        self.translatesAutoresizingMaskIntoConstraints = false

        [titleLabel, nameLabeledTextField, guestLabeledTextField, tableLabeledTextField, bookingSwitch, prepaySwitch, vipSwitch, checkButton].forEach {
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 70),
            nameLabeledTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            nameLabeledTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nameLabeledTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            guestLabeledTextField.topAnchor.constraint(equalTo: nameLabeledTextField.bottomAnchor, constant: 20),
            guestLabeledTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            guestLabeledTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableLabeledTextField.topAnchor.constraint(equalTo: guestLabeledTextField.bottomAnchor, constant: 20),
            tableLabeledTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableLabeledTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bookingSwitch.topAnchor.constraint(equalTo: tableLabeledTextField.bottomAnchor, constant: 40),
            bookingSwitch.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            bookingSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            bookingSwitch.heightAnchor.constraint(equalToConstant: 30),
            prepaySwitch.topAnchor.constraint(equalTo: bookingSwitch.bottomAnchor, constant: 10),
            prepaySwitch.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            prepaySwitch.widthAnchor.constraint(equalToConstant: 300),
            prepaySwitch.heightAnchor.constraint(equalToConstant: 30),
            vipSwitch.topAnchor.constraint(equalTo: prepaySwitch.bottomAnchor, constant: 10),
            vipSwitch.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            vipSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            vipSwitch.heightAnchor.constraint(equalToConstant: 30),
            checkButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            checkButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            checkButton.widthAnchor.constraint(equalToConstant: 200),
            checkButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
