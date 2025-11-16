//
//  LoginView.swift
//  UISwitch
//
//  Created by Дарья Литвинова on 08.10.2025.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func loginButtonTapped()
    
    func signUpButtonTapped()
}

class LoginView: UIView {
    
    weak var delegate: LoginViewDelegate?

    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: .loginLogo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.textColor = .black
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var emailTextField: LabeledTextFieldView = {
        let view = LabeledTextFieldView(labelText: "Email")
        
        return view
    }()
    
    lazy var passwordTextField: LabeledTextFieldView = {
        let view = LabeledTextFieldView(labelText: "Пароль")
        
        return view
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Еще нет аккаунта? Зарегистироваться", for: .normal)
        button.setTitleColor(.pinkAccent, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .pinkAccent
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
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

private extension LoginView {
    private func setupUI() {
        self.backgroundColor = .systemBackground
        self.translatesAutoresizingMaskIntoConstraints = false
        
        [logoImageView, loginLabel, emailTextField, passwordTextField, forgotPasswordButton, loginButton].forEach {
            self.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 30),
            logoImageView.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -30),
            loginLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            loginLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            loginLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            emailTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            signUpButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            signUpButton.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor),
            signUpButton.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor),
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
    
    @objc func loginButtonTapped() {
        // проверка на логин
        if let data = LocalStorage.shared.load(key: "userProfile") {
            if data["login"] != emailTextField.textField.text || data["password"] != passwordTextField.textField.text {
                //ошибка
            }
        }
        else {
            let data: [String: String] = ["login": emailTextField.textField.text!, "password": passwordTextField.textField.text!]
            LocalStorage.shared.save(data: data, key: "userProfile")
        }
        delegate?.loginButtonTapped()
    }
    
    @objc func forgotPasswordButtonTapped() {
        delegate?.signUpButtonTapped()
    }
}
