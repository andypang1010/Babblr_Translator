//
//  TranslatedTextViewController.swift
//  Babblr_Translator
//
//  Created by Andy Pang on 2022/10/9.
//

import UIKit

class TranslatedTextViewController : UIViewController {
    
    var inputText = ""
    var translatedTextView = UITextView()
    var copyButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Utilities.backgroundColor
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = Utilities.backgroundColor
        navigationController!.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: Utilities.primaryColor!]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Utilities.primaryColor!]
        navigationItem.title = "Translated Text"
        
        translatedTextView = {
            let textView = UITextView()
            textView.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            textView.font = Utilities.defaultFont
            textView.text = inputText
            textView.isEditable = false
            textView.textColor = Utilities.primaryColor
            textView.layer.cornerRadius = Utilities.defaultRadius
            textView.backgroundColor = Utilities.secondaryColor
            
            return textView
        }()
        
        copyButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "paperclip.circle.fill"), for: .normal)
            button.tintColor = Utilities.tintColor
            button.contentHorizontalAlignment = .fill
            button.contentVerticalAlignment = .fill
            button.addTarget(self, action: #selector(copyButtonTapped), for: .touchUpInside)
            
            return button
        }()
        
        Utilities.addViews([translatedTextView, copyButton], view)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            translatedTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            translatedTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            translatedTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            translatedTextView.bottomAnchor.constraint(equalTo: copyButton.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            copyButton.topAnchor.constraint(equalTo: translatedTextView.bottomAnchor, constant: 20),
            copyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            copyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            copyButton.heightAnchor.constraint(equalToConstant: 80),
            copyButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc func copyButtonTapped() {
        UIPasteboard.general.string = translatedTextView.text
        Utilities.showMessage("Copied!", self)
    }
}
