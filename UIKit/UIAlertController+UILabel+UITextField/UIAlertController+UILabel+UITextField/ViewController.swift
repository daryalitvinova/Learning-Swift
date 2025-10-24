//
//  ViewController.swift
//  UIAlertController+UILabel+UITextField
//
//  Created by Дарья Литвинова on 24.09.2025.
//

import UIKit

class ViewController: UIViewController {
    
    var randomNumber = Int.random(in: 1...100)
    
    lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Привет,"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var additionButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Сложение", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(additionButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var guessNumberButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Угадай число", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(guessNumberButtonTapped), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(helloLabel)
        view.addSubview(additionButton)
        view.addSubview(guessNumberButton)
        
        NSLayoutConstraint.activate([
            helloLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
            helloLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
            additionButton.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 16),
            additionButton.widthAnchor.constraint(equalToConstant: 200),
            additionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            additionButton.heightAnchor.constraint(equalToConstant: 50),
            guessNumberButton.topAnchor.constraint(equalTo: additionButton.bottomAnchor, constant: 16),
            guessNumberButton.widthAnchor.constraint(equalToConstant: 200),
            guessNumberButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            guessNumberButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showAlert(title: "Привет", message: "Введите имя:", style: UIAlertController.Style.alert)
    }

    func showAlert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField()
        
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            let text = alertController.textFields?.first
            self.helloLabel.text! += " \(text?.text! ?? "")!"
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func additionButtonTapped() {
        let alertController = UIAlertController(title: "Сложение", message: "", preferredStyle: .alert)
        // textField можно добавлять только у .alert
        alertController.addTextField()
        let firstTextField = alertController.textFields?.first
        firstTextField?.placeholder = "Первое число"
        
        alertController.addTextField()
        let secondTextField = alertController.textFields?.last
        secondTextField?.placeholder = "Второе число"
        
        let action = UIAlertAction(title: "Вычислить", style: .default) { _ in
            let firstNumber = Double(firstTextField?.text ?? "0") ?? 0
            let secondNumber = Double(secondTextField?.text ?? "0") ?? 0
            self.helloLabel.text = String(firstNumber + secondNumber)
        }
        alertController.addAction(action)
        
        self.present(alertController, animated: true)
    }
    
    @objc func guessNumberButtonTapped() {
        let alertController = UIAlertController(title: "Угадай число", message: "Введите число от 1 до 100", preferredStyle: .alert)
        alertController.addTextField()
        
        let action = UIAlertAction(title: "Проверить", style: .default) { _ in
            let enteredNumber = Int(alertController.textFields?.first?.text ?? "") ?? 0
            
            if enteredNumber == self.randomNumber {
                self.helloLabel.text = "Вы угадали!"
                self.randomNumber = Int.random(in: 1...100)
                print(self.randomNumber)
            } else {
                self.helloLabel.text = "Вы ошиблись:("
                print(self.randomNumber)
            }
        }
        alertController.addAction(action)
        
        self.present(alertController, animated: true)
    }

}

