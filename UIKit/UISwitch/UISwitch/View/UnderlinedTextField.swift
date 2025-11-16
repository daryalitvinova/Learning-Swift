//
//  UnderlinedTextField.swift
//  UISwitch
//
//  Created by Дарья Литвинова on 09.10.2025.
//

import UIKit

class UnderlinedTextField: UITextField {

    private let underline = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        borderStyle = .none
        
        underline.translatesAutoresizingMaskIntoConstraints = false
        underline.backgroundColor = .underlineGray
        addSubview(underline)
        
        NSLayoutConstraint.activate([
            underline.heightAnchor.constraint(equalToConstant: 1),
            underline.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            underline.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            underline.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
