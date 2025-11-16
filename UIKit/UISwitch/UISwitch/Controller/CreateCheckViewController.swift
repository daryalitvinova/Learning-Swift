//
//  CreateCheckViewController.swift
//  UISwitch
//
//  Created by Дарья Литвинова on 14.10.2025.
//

import UIKit

class CreateCheckViewController: UIViewController {
    
    lazy var checkView: CreateCheckView = {
        let view = CreateCheckView()
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(checkView)
        
        NSLayoutConstraint.activate([
            checkView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            checkView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            checkView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            checkView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
