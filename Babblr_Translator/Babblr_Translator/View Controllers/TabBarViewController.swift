//
//  ViewController.swift
//  Babblr_Translator
//
//  Created by Andy Pang on 2022/10/7.
//

import UIKit

class TabBarViewController: UIViewController {
    
    var tabBarViewController = UITabBarController()
    let textTranslatorViewController = UINavigationController(rootViewController: TextTranslatorViewController())
    let audioTranslatorViewController = UINavigationController(rootViewController: AudioTranslatorViewController())
    let historyViewController = UINavigationController(rootViewController: HistoryViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Utilities.backgroundColor
        
        tabBarViewController = {
            let tabBar = UITabBarController()
            tabBar.setViewControllers([textTranslatorViewController, audioTranslatorViewController, historyViewController], animated: true)
            tabBar.modalPresentationStyle = .fullScreen
            tabBar.tabBar.tintColor = Utilities.tintColor
            return tabBar
        }()
        
        guard let icons = tabBarViewController.tabBar.items else {
            return
        }
        
        let iconsImage = ["textformat", "mic", "list.bullet.rectangle.portrait"]
        for i in 0..<icons.count {
            icons[i].image = UIImage(systemName: iconsImage[i])
        }
        
        present(tabBarViewController, animated: true)
    }


}

