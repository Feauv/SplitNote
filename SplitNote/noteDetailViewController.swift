//
//  noteDetailViewController.swift
//  SplitNote
//
//  Created by Nick J Grove on 10/14/18.
//  Copyright © 2018 teamSplitNote. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    @IBOutlet var progressBar: UIProgressView!
    
    @IBOutlet var transcriptionBackground: UIView!
    @IBOutlet var divider: UIView!
    
    @IBOutlet var transcription: UILabel!
    
    @IBOutlet var previousNote: UIButton!
    @IBOutlet var play: UIButton!
    //@IBOutlet var pause: UIButton!
    @IBOutlet var nextNote: UIButton!
    
    var SplitNoteDarkPurple = UIColor(displayP3Red: 66/255, green: 39/255, blue: 90/255, alpha: 1.0)
    var SplitNoteLightPurple = UIColor(displayP3Red: 115/255, green: 75/255, blue: 109/255, alpha: 1.0)
    
    private lazy var gradient: CAGradientLayer = {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [SplitNoteLightPurple.cgColor,SplitNoteDarkPurple.cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: view.frame.height, height: (view.frame.height*4.5)/8)
        return gradientLayer
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupComponents()
        setupNavigationBarItems()
        
    }
    
    private func setupComponents() {
        
        transcriptionBackground = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: (view.frame.height*4.5)/8))
        transcriptionBackground.layer.insertSublayer(gradient, at: 0)
        
        progressBar = UIProgressView(frame: CGRect(x: 50, y: 50, width: view.frame.width - 100, height: 10))
        progressBar.progressTintColor = .white
        progressBar.trackTintColor = .lightGray
        progressBar.setProgress(0.5, animated: true)
        
        previousNote = UIButton(frame: CGRect(x: 80, y: 80, width: 50, height: 50))
        previousNote.backgroundColor = .clear
        previousNote.layer.cornerRadius = 25
        previousNote.layer.borderColor = UIColor.white.cgColor
        previousNote.layer.borderWidth = 1.0
        
        previousNote.setTitle("Prev.", for: [])
        previousNote.setTitleColor(.white, for: [])
        
        play = UIButton(frame: CGRect(x: (view.frame.width/2) - 25, y: 80, width: 50, height: 50))
        play.backgroundColor = .clear
        play.layer.cornerRadius = 25
        play.layer.borderColor = UIColor.white.cgColor
        play.layer.borderWidth = 1.0
        
        play.setTitle("Play", for: [])
        play.setTitleColor(.white, for: [])
        
        nextNote = UIButton(frame: CGRect(x: view.frame.width - 130, y: 80, width: 50, height: 50))
        nextNote.backgroundColor = .clear
        nextNote.layer.cornerRadius = 25
        nextNote.layer.borderColor = UIColor.white.cgColor
        nextNote.layer.borderWidth = 1.0
        
        nextNote.setTitle("Next", for: [])
        nextNote.setTitleColor(.white, for: [])
        
        divider = UIView(frame: CGRect(x: 0, y: 180, width: view.frame.width, height: 1))
        divider.backgroundColor = .white
        
        transcription = UILabel(frame: CGRect(x: 40, y: (view.frame.height/16) + 160, width: view.frame.width - 80, height: 250))
        transcription.layer.borderColor = UIColor.lightGray.cgColor
        transcription.layer.borderWidth = 1.0
        transcription.backgroundColor = UIColor(white: 1.0, alpha: 0.25)
        transcription.clipsToBounds = true
        transcription.layer.cornerRadius = 8
        
        view.addSubview(transcriptionBackground)
        view.addSubview(progressBar)
        view.addSubview(previousNote)
        view.addSubview(play)
        view.addSubview(nextNote)
        view.addSubview(divider)
        view.addSubview(transcription)
        
    }
    
    private func setupNavigationBarItems() {
        
        navigationController?.navigationBar.barTintColor = SplitNoteDarkPurple
        
        navigationItem.title = "Note Detail"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false;
        
    }
    
}
