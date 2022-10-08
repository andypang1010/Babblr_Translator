//
//  ViewController.swift
//  Babblr_Translator
//
//  Created by Andy Pang on 2022/10/7.
//

import UIKit

class TabBarViewController: UIViewController {
    
    let tabBarViewController = UITabBarController()
    let textTranslatorViewController = UINavigationController(rootViewController: TextTranslatorViewController())
    let audioTranslatorViewController = UINavigationController(rootViewController: AudioTranslatorViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

//        textTranslatorViewController.title = "Text"
//        audioTranslatorViewController.title = "Audio"
        
        tabBarViewController.setViewControllers([textTranslatorViewController, audioTranslatorViewController], animated: true)
        tabBarViewController.modalPresentationStyle = .fullScreen
        
        guard let icons = tabBarViewController.tabBar.items else {
            return
        }
        
        // Set the image of each tab bar icon
        let iconsImage = ["textformat", "mic"]
        for i in 0..<icons.count {
            icons[i].image = UIImage(systemName: iconsImage[i])
        }
        
        present(tabBarViewController, animated: true)
    }


}

