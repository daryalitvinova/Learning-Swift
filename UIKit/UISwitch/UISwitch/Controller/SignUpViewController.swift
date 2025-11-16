//
//  SignUpViewController.swift
//  UISwitch
//
//  Created by Дарья Литвинова on 16.10.2025.
//

import UIKit

class SignUpViewController: UIViewController {
    
    lazy var signUpView: SignUpView = {
        let view = SignUpView()
        view.delegate = self
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(signUpView)
        
        NSLayoutConstraint.activate([
            signUpView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            signUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            signUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            signUpView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension UIViewController: SignUpViewDelegate {
    func didTapSignUpButton(email: String, password: String) {
        let user = ["email": email, "password": password]
        LocalStorage.shared.save(data: user, key: "userProfile")
        
        let checkVC = CreateCheckViewController()
        checkVC.modalPresentationStyle = .fullScreen
        self.present(checkVC, animated: true)
    }
    
    
}
