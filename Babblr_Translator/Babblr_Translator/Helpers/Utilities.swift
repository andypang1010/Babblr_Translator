//
//  Utilities.swift
//  Babblr_Translator
//
//  Created by Andy Pang on 2022/10/7.
//

import UIKit

class Utilities {
    
    static let defaultRadius = CGFloat(30)
    static let defaultFont = UIFont.systemFont(ofSize: 18)
    
    static let primaryColor = UIColor(named: "Primary Color")
    static let secondaryColor = UIColor(named: "Secondary Color")
    static let tintColor = UIColor(named: "Tint Color")
    static let backgroundColor = UIColor(named: "Background Color")
    
    static let inputLanguages = ["BG" : "Bulgarian",
                                 "CS" : "Czech",
                                 "DA" : "Danish",
                                 "DE" : "German",
                                 "EL" : "Greek",
                                 "EN" : "English",
                                 "ES" : "Spanish",
                                 "ET" : "Estonian",
                                 "FI" : "Finnish",
                                 "FR" : "French",
                                 "HU" : "Hungarian",
                                 "ID" : "Indonesian",
                                 "IT" : "Italian",
                                 "JA" : "Japanese",
                                 "LT" : "Lithuanian",
                                 "LV" : "Latvian",
                                 "NL" : "Dutch",
                                 "PL" : "Polish",
                                 "PT" : "Portuguese",
                                 "RO" : "Romanian",
                                 "RU" : "Russian",
                                 "SK" : "Slovak",
                                 "SL" : "Slovenian",
                                 "SV" : "Swedish",
                                 "TR" : "Turkish",
                                 "UK" : "Ukrainian",
                                 "ZH" : "Chinese"]
    
    static let outputLanguages = ["BG" : "Bulgarian",
                                  "CS" : "Czech",
                                  "DA" : "Danish",
                                  "DE" : "German",
                                  "EL" : "Greek",
                                  "EN-GB" : "English (British)",
                                  "EN-US" : "English (American)",
                                  "ES" : "Spanish",
                                  "ET" : "Estonian",
                                  "FI" : "Finnish",
                                  "FR" : "French",
                                  "HU" : "Hungarian",
                                  "ID" : "Indonesian",
                                  "IT" : "Italian",
                                  "JA" : "Japanese",
                                  "LT" : "Lithuanian",
                                  "LV" : "Latvian",
                                  "NL" : "Dutch",
                                  "PL" : "Polish",
                                  "PT-BR" : "Portuguese (Brazilian)",
                                  "PT-PT" : "Portuguese",
                                  "RO" : "Romanian",
                                  "RU" : "Russian",
                                  "SK" : "Slovak",
                                  "SL" : "Slovenian",
                                  "SV" : "Swedish",
                                  "TR" : "Turkish",
                                  "UK" : "Ukrainian",
                                  "ZH" : "Chinese (Simplified)"]
    
    /// Shows a alert with a message on a view controller
    /// - Parameters:
    ///   - errorMessage: The message that is being shown on the alert
    ///   - viewController: The view controller that the alert belongs to
    static func showAlert(_ errorMessage: String, _ viewController: UIViewController) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    /// Adds all UIView subviews to a designated view
    /// - Parameters:
    ///   - views: An array of subviews in a view controller
    ///   - view: The designated view that the subviews are added to
    static func addViews(_ views: [UIView], _ view: UIView) {
        views.forEach {
            subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(subView)
        }
    }
}
