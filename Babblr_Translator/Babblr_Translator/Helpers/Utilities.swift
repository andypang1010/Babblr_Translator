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
    static let pickerFont = UIFont.systemFont(ofSize: 14)
    
    static let primaryColor = UIColor(named: "Primary Color")
    static let secondaryColor = UIColor(named: "Secondary Color")
    static let tintColor = UIColor(named: "Tint Color")
    static let backgroundColor = UIColor(named: "Background Color")

    static let languageDictionary = [
        "Bulgarian": NetworkManager.Language.bulgarian,
        "Czech": NetworkManager.Language.czech,
        "Danish": NetworkManager.Language.danish,
        "German": NetworkManager.Language.german,
        "Greek": NetworkManager.Language.greek,
        "English": NetworkManager.Language.english,
        "Spanish": NetworkManager.Language.spanish,
        "Estonian": NetworkManager.Language.estonian,
        "Finnish": NetworkManager.Language.finnish,
        "French": NetworkManager.Language.french,
        "Hungarian": NetworkManager.Language.hungarian,
        "Indonesian": NetworkManager.Language.indonesian,
        "Italian": NetworkManager.Language.italian,
        "Japanese": NetworkManager.Language.japanese,
        "Korean": NetworkManager.Language.korean,
        "Lithuanian": NetworkManager.Language.lithuanian,
        "Latvian": NetworkManager.Language.latvian,
        "Norwegian": NetworkManager.Language.norwegian,
        "Dutch": NetworkManager.Language.dutch,
        "Polish": NetworkManager.Language.polish,
        "Portuguese": NetworkManager.Language.portuguese,
        "Romanian": NetworkManager.Language.romanian,
        "Russian": NetworkManager.Language.russian,
        "Slovak": NetworkManager.Language.slovak,
        "Slovenian": NetworkManager.Language.slovenian,
        "Swedish": NetworkManager.Language.swedish,
        "Turkish": NetworkManager.Language.turkish,
        "Ukrainian": NetworkManager.Language.ukrainian,
        "Chinese": NetworkManager.Language.chinese
    ]
    
    /// Shows a message on a view controller
    /// - Parameters:
    ///   - message: The message that is being shown
    ///   - viewController: The view controller that the alert belongs to
    static func showMessage(_ message: String, _ viewController: UIViewController) {
        let message = UIAlertController(title: message, message: "", preferredStyle: .alert)
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when) {
            message.dismiss(animated: true, completion: nil)
        }
        viewController.present(message, animated: true, completion: nil)
    }
    
    /// Shows an alert with an error message on a view controller
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
