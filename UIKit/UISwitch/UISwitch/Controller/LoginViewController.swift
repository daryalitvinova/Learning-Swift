//
//  ViewController.swift
//  UISwitch
//
//  Created by Дарья Литвинова on 08.10.2025.
//

import UIKit

class LoginViewController: UIViewController {
    private lazy var loginView = {
        let view = LoginView()
        view.delegate = self
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(loginView)
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            loginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension LoginViewController: LoginViewDelegate {
    func loginButtonTapped() {
        let checkVC = CreateCheckViewController()
        checkVC.modalPresentationStyle = .fullScreen //read
        checkVC.modalTransitionStyle = .crossDissolve //read
        self.present(checkVC, animated: true)
    }
    
    func signUpButtonTapped() {
        let signUpVC = SignUpViewController()
        signUpVC.modalPresentationStyle = .fullScreen
        self.present(signUpVC, animated: true)
    }
}
