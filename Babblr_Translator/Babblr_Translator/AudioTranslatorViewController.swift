//
//  AudioTranslatorViewController.swift
//  Babblr_Translator
//
//  Created by Andy Pang on 2022/10/7.
//

import UIKit

class AudioTranslatorViewController : UIViewController {
    
    var transcribeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .systemBackground
        navigationItem.title = "Audio"
        
        transcribeButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "mic.circle.fill"), for: .normal)
            button.tintColor = .tintColor
            button.contentHorizontalAlignment = .fill
            button.contentVerticalAlignment = .fill
            button.addTarget(self, action: #selector(transcribeButtonHeld), for: .touchDown)
            return button
        }()
        
        Utilities.addViews([transcribeButton], view)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            transcribeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            transcribeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            transcribeButton.widthAnchor.constraint(equalToConstant: 80),
            transcribeButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc func transcribeButtonHeld() {
        
    }
}
