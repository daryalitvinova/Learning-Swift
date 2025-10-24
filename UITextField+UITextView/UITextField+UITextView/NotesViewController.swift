//
//  ViewController.swift
//  UITextField+UITextView
//
//  Created by Дарья Литвинова on 02.09.2025.
//

import UIKit

class NotesViewController: UIViewController {
    
    private lazy var titleField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 20, weight: .bold)
        textField.placeholder = "Введите название..."
        textField.backgroundColor = #colorLiteral(red: 1, green: 0.8867120743, blue: 1, alpha: 1)
        textField.textColor = #colorLiteral(red: 0.4122528732, green: 0.2465313375, blue: 0.4294755459, alpha: 1)
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.clearButtonMode = .whileEditing
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var descriptionView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 1, green: 0.739500463, blue: 0.8618702292, alpha: 1)
        textView.textColor = #colorLiteral(red: 0.6247550845, green: 0.4418443441, blue: 0.5149021149, alpha: 1)
        textView.font = .monospacedSystemFont(ofSize: 16, weight: .regular)
        textView.borderStyle = .none
        textView.textContainer.lineFragmentPadding = 20
        // у UITextView нет placeholder
        
        textView.linkTextAttributes = [.foregroundColor: UIColor.systemBlue]
        textView.isSelectable = true // чтобы можно было тапать по ссылкам, номерам...
        textView.isEditable = false // если тут true, выделения ссылок нет
        textView.isUserInteractionEnabled = true
        textView.dataDetectorTypes = []
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        textView.addGestureRecognizer(tap)
        
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        descriptionView.delegate = self
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleField)
        view.addSubview(descriptionView)
        
        NSLayoutConstraint.activate([
            titleField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleField.heightAnchor.constraint(equalToConstant: 40),
            
            descriptionView.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 30),
            descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            descriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            descriptionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 40)
        ])
    }
    
    @objc func handleTap() {
        if !descriptionView.isEditable {
            descriptionView.isEditable = true
            descriptionView.dataDetectorTypes = []
            descriptionView.becomeFirstResponder()
        }
    }
}

extension NotesViewController: UITextViewDelegate {
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.isEditable = false
        textView.dataDetectorTypes = [.link, .phoneNumber]
    }
}

