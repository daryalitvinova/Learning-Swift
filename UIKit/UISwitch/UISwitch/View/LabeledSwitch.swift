//
//  LabeledSwitch.swift
//  UISwitch
//
//  Created by Дарья Литвинова on 14.10.2025.
//

import UIKit

class LabeledSwitch: UIView {

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .pinkAccent
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        
        return label
    }()
    
    lazy var switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        
        return switchControl
    }()

    init (text: String) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        [label, switchControl].forEach {
            addSubview($0)
        }
        
        label.text = text
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            switchControl.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            switchControl.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
