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
