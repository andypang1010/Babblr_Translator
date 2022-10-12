//
//  AudioTranslatorViewController.swift
//  Babblr_Translator
//
//  Created by Andy Pang on 2022/10/7.
//

import UIKit
import AVFoundation

class AudioTranslatorViewController : UIViewController {
    
    var isRecording = false
    
    var transcribedTextView = UITextView()
    var transcribeButton = UIButton()
    
    var recordingSession = AVAudioSession()
    var audioRecorder = AVAudioRecorder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Utilities.backgroundColor
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = Utilities.backgroundColor
        navigationController!.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: Utilities.primaryColor!]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Utilities.primaryColor!]
        navigationItem.title = "Audio"
        
        transcribedTextView = {
            let textView = UITextView()
            textView.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            textView.font = Utilities.defaultFont
            textView.textColor = .tertiaryLabel
            textView.isEditable = false
            textView.layer.cornerRadius = Utilities.defaultRadius
            textView.backgroundColor = Utilities.secondaryColor

            return textView
        }()
        
        transcribeButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "mic.circle.fill"), for: .normal)
            button.tintColor = Utilities.tintColor
            button.contentHorizontalAlignment = .fill
            button.contentVerticalAlignment = .fill
            button.addTarget(self, action: #selector(transcribeButtonTapped), for: .touchDown)
            return button
        }()
        
        Utilities.addViews([transcribedTextView, transcribeButton], view)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            transcribedTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            transcribedTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            transcribedTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            transcribedTextView.bottomAnchor.constraint(equalTo: transcribeButton.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            transcribeButton.topAnchor.constraint(equalTo: transcribedTextView.bottomAnchor, constant: 20),
            transcribeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            transcribeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            transcribeButton.heightAnchor.constraint(equalToConstant: 80),
            transcribeButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
   
    @objc func transcribeButtonTapped() {
        isRecording = !isRecording
        if (isRecording) {
            transcribeButton.setImage(UIImage(systemName: "stop.circle.fill"), for: .normal)
            transcribedTextView.isEditable = false
            startRecording()
        }
        else {
            transcribeButton.setImage(UIImage(systemName: "mic.circle.fill"), for: .normal)
            transcribedTextView.isEditable = true
            stopRecording()
        }
    }
    
    func startRecording() {
//        TODO: Implement Start Recording
    }
    
    func stopRecording() {
//        TODO: Implement Stop Recording
    }
}
