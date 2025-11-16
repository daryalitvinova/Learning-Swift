//
//  SignUpView.swift
//  UISwitch
//
//  Created by Дарья Литвинова on 16.10.2025.
//

import UIKit

protocol SignUpViewDelegate: AnyObject {
    func didTapSignUpButton(email: String, password: String)
}

class SignUpView: UIView {
    weak var delegate: SignUpViewDelegate?
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: .loginLogo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
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
    
    lazy var confirmPasswordTextField: LabeledTextFieldView = {
        let view = LabeledTextFieldView(labelText: "Повторите пароль")
        
        return view
    }()
    
    lazy var signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.backgroundColor = .pinkAccent
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
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

extension SignUpView {
    private func setupUI() {
        self.backgroundColor = .systemBackground
        self.translatesAutoresizingMaskIntoConstraints = false
        
        [logoImageView, signUpLabel, emailTextField, passwordTextField, confirmPasswordTextField, signupButton].forEach {
            self.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 30),
            logoImageView.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -30),
            signUpLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            signUpLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            signUpLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            emailTextField.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            signupButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            signupButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            signupButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            signupButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func signUpButtonTapped() {
        guard emailTextField.textField.text != "" && passwordTextField.textField.text != "" && passwordTextField.textField.text == confirmPasswordTextField.textField.text else { return }
        delegate?.didTapSignUpButton(email: emailTextField.textField.text!, password: passwordTextField.textField.text!)
    }
}
