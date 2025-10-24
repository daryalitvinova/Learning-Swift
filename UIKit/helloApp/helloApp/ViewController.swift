//
//  ViewController.swift
//  helloApp
//
//  Created by Дарья Литвинова on 07.10.2025.
//

import UIKit

class ViewController: UIViewController {
    
    // модель бы не сюда, но тут вью + контроллер сразу, пусть тут пока
    var model = WordModel("hello")
    
    lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.739467144, green: 0.6701705456, blue: 1, alpha: 1)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showHello), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9340155721, green: 0.8818677068, blue: 1, alpha: 1)
        view.addSubview(helloLabel)
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            helloLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 10),
            helloLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -10),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func showHello() {
        let alertController = UIAlertController(title: "Say hello", message: "", preferredStyle: .alert)
        alertController.addTextField()
        
        let action = UIAlertAction(title: "Ok", style: .default) { [weak self] _ in
            self?.helloLabel.text = self?.model.changeWord(alertController.textFields?.first?.text ?? "")
        }
        alertController.addAction(action)
        
        self.present(alertController, animated: true)
    }

}

