//
//  TextTranslatorViewController.swift
//  Babblr_Translator
//
//  Created by Andy Pang on 2022/10/7.
//

import UIKit

class TextTranslatorViewController : UIViewController {
    
    let sortedLanguageDictionary = Utilities.languageDictionary.keys.sorted()
    let networkManager = NetworkManager()
    
    var inputTextView = UITextView()
    var translateButton = UIButton()
    
    var languagePickerView = UIPickerView()
    
    var sourceLanguage = NetworkManager.Language.bulgarian
    var targetLanguage = NetworkManager.Language.bulgarian
    
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
            textView.autocapitalizationType = .none

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
        
        languagePickerView = {
            let pickerView = UIPickerView()
            pickerView.backgroundColor = Utilities.secondaryColor
            pickerView.layer.cornerRadius = Utilities.defaultRadius
            pickerView.dataSource = self as UIPickerViewDataSource
            pickerView.delegate = self as UIPickerViewDelegate
            return pickerView
        }()
        
        Utilities.addViews([inputTextView, translateButton, languagePickerView], view)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            inputTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            inputTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            inputTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            inputTextView.bottomAnchor.constraint(equalTo: translateButton.topAnchor, constant: -120)
        ])
        
        NSLayoutConstraint.activate([
            languagePickerView.topAnchor.constraint(equalTo: inputTextView.bottomAnchor, constant: 20),
            languagePickerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            languagePickerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            languagePickerView.bottomAnchor.constraint(equalTo: translateButton.topAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            translateButton.topAnchor.constraint(equalTo: languagePickerView.bottomAnchor, constant: 20),
            translateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            translateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            translateButton.heightAnchor.constraint(equalToConstant: 80),
            translateButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc func translateButtonTapped() {
        if inputTextView.textColor != .tertiaryLabel && inputTextView.text.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            networkManager.translate(text: inputTextView.text, sourceLanguage: sourceLanguage, targetLanguage: targetLanguage) { result in
                switch result {
                case .success(let translation):
                    DispatchQueue.main.async {
                        let translatedTextViewController = TranslatedTextViewController()
                        translatedTextViewController.navigationItem.title = "Translated Text"
                        translatedTextViewController.inputText = translation
                        self.present(UINavigationController(rootViewController: translatedTextViewController), animated: true)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        Utilities.showAlert(error.localizedDescription, self)
                    }
                }
            }
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

extension TextTranslatorViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Utilities.languageDictionary.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var pickerLabel = UILabel()
        if let v = view {
            pickerLabel = v as! UILabel
        }
        
        pickerLabel.font = Utilities.pickerFont
        pickerLabel.textColor = Utilities.primaryColor
        pickerLabel.textAlignment = .center
        pickerLabel.text = sortedLanguageDictionary[row]
        
        return pickerLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 0) {
            sourceLanguage = Utilities.languageDictionary[sortedLanguageDictionary[row]]!
            print(sourceLanguage.rawValue)
        }
        
        else if (component == 1) {
            targetLanguage = Utilities.languageDictionary[sortedLanguageDictionary[row]]!
            print(targetLanguage.rawValue)
        }
    }
}
