//
//  TextTranslatorViewController.swift
//  Babblr_Translator
//
//  Created by Andy Pang on 2022/10/7.
//

import UIKit

class TextTranslatorViewController : UIViewController {
    
    var inputTextView = UITextView()
    var translateButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Utilities.backgroundColor
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = Utilities.backgroundColor
        navigationController!.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: Utilities.primaryColor!]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Utilities.primaryColor!]
        navigationItem.title = "Text"
        
        inputTextView = {
            let textView = UITextView()
            textView.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            textView.font = Utilities.defaultFont
            textView.delegate = self
            textView.text = "Type here to translate"
            textView.textColor = .tertiaryLabel
            textView.layer.cornerRadius = Utilities.defaultRadius
            textView.backgroundColor = Utilities.secondaryColor

            return textView
        }()
        
        translateButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "repeat.circle.fill"), for: .normal)
            button.tintColor = Utilities.tintColor
            button.contentHorizontalAlignment = .fill
            button.contentVerticalAlignment = .fill
            button.addTarget(self, action: #selector(translateButtonTapped), for: .touchUpInside)
            
            return button
        }()
        
        Utilities.addViews([inputTextView, translateButton], view)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            inputTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            inputTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            inputTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            inputTextView.bottomAnchor.constraint(equalTo: translateButton.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            translateButton.topAnchor.constraint(equalTo: inputTextView.bottomAnchor, constant: 20),
            translateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            translateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            translateButton.heightAnchor.constraint(equalToConstant: 80),
            translateButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc func translateButtonTapped() {
        if inputTextView.textColor != .tertiaryLabel && inputTextView.text.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            let translatedTextViewController = TranslatedTextViewController()
            translatedTextViewController.navigationItem.title = "Translated Text"
            translatedTextViewController.inputText = inputTextView.text
            present(UINavigationController(rootViewController: translatedTextViewController), animated: true)
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension TextTranslatorViewController : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .tertiaryLabel {
            textView.text = nil
            textView.textColor = Utilities.primaryColor
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Type here to translate"
            textView.textColor = .tertiaryLabel
        }
    }
}
