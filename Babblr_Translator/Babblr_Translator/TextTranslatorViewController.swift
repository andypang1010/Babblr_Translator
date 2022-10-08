//
//  TextTranslatorViewController.swift
//  Babblr_Translator
//
//  Created by Andy Pang on 2022/10/7.
//

import UIKit

class TextTranslatorViewController : UIViewController {
    
    var inputTextView = UITextView()
    var translatedTextView = UITextView()
    var translateButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .systemBackground
        navigationItem.title = "Text"
        
        inputTextView = {
            let textView = UITextView()
            textView.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            textView.font = Utilities.defaultFont
            textView.delegate = self
            textView.text = "Type here to translate"
            textView.textColor = .tertiaryLabel
            textView.layer.cornerRadius = Utilities.defaultRadius
            textView.backgroundColor = .secondarySystemBackground

            return textView
        }()
        
        translatedTextView = {
            let textView = UITextView()
            textView.isEditable = false
            textView.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            textView.font = Utilities.defaultFont
            textView.textColor = .secondaryLabel
            textView.layer.cornerRadius = Utilities.defaultRadius
            textView.backgroundColor = .secondarySystemBackground
            
            return textView
        }()
        
        translateButton = {
            let button = UIButton()
            button.backgroundColor = .tintColor
            button.setTitle("Translate", for: .normal)
            button.addTarget(self, action: #selector(translateButtonTapped), for: .touchUpInside)
            button.layer.cornerRadius = 16
            
            return button
        }()
        
        Utilities.addViews([inputTextView, translatedTextView, translateButton], view)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            inputTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            inputTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            inputTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            inputTextView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            translatedTextView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            translatedTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            translatedTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            translateButton.topAnchor.constraint(equalTo: translatedTextView.bottomAnchor, constant: 20),
            translateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            translateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            translateButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func translateButtonTapped() {
        if inputTextView.textColor != .tertiaryLabel {
            translatedTextView.text = inputTextView.text
        }
    }
}

extension TextTranslatorViewController : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .tertiaryLabel {
            textView.text = nil
            textView.textColor = .label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Type here to translate"
            textView.textColor = .tertiaryLabel
        }
    }
}
