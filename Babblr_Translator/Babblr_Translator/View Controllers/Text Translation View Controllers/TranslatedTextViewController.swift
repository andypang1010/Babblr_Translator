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
            textView.textColor = Utilities.tintColor
            textView.layer.cornerRadius = Utilities.defaultRadius
            textView.backgroundColor = Utilities.secondaryColor
            
            return textView
        }()
        
        Utilities.addViews([translatedTextView], view)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            translatedTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            translatedTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            translatedTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            translatedTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
