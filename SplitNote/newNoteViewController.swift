//
//  newNoteViewController.swift
//  SplitNote
//
//  Created by Nick J Grove on 10/13/18.
//  Copyright © 2018 teamSplitNote. All rights reserved.
//

import UIKit

class NewNoteViewController: UIViewController {
    
    @IBOutlet var transcription: UILabel!
    @IBOutlet var flagLabel: UILabel!
    @IBOutlet var enterFlagText: UIButton!
    
    @IBOutlet var newNoteView: UIView!
    @IBOutlet var divider: UIView!
    
    var SplitNotePurple = UIColor(displayP3Red: 115/255, green: 75/255, blue: 109/255, alpha: 1.0)
    
    private lazy var gradient: CAGradientLayer = {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(displayP3Red: 142/255, green: 141/255, blue: 141/255, alpha: 1.0).cgColor,UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.frame = view.bounds
        return gradientLayer
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComponents()

    }
    
    private func setupComponents() {
        
        newNoteView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        newNoteView.layer.insertSublayer(gradient, at: 0)
        
        transcription = UILabel(frame: CGRect(x: 40, y: 100, width: view.frame.width - 80, height: 250))
        setSplitNoteStandardLabel(label: transcription)
        
        flagLabel = UILabel(frame: CGRect(x: 40, y: view.frame.height - 160, width: view.frame.width - 160, height: 120))
        setSplitNoteStandardLabel(label: flagLabel)
        
        enterFlagText = UIButton(frame: CGRect(x: view.frame.width - 110, y: view.frame.height - 140, width: 80, height: 80))
        enterFlagText.setTitle("Enter", for: [])
        enterFlagText.setTitleColor(SplitNotePurple, for: [])
        enterFlagText.backgroundColor = UIColor.clear
        enterFlagText.layer.cornerRadius = 40
        enterFlagText.layer.borderColor = SplitNotePurple.cgColor
        enterFlagText.layer.borderWidth = 2.0
        enterFlagText.addTarget(self, action: #selector(enterText(_:)), for: .touchUpInside)
        
        divider = UIView(frame: CGRect(x: 0, y: view.frame.height-302, width: view.frame.width, height: 2))
        divider.backgroundColor = SplitNotePurple
        
        view.addSubview(newNoteView)
        view.addSubview(transcription)
        view.addSubview(flagLabel)
        view.addSubview(enterFlagText)
        view.addSubview(divider)
        
    }
    
    private func setSplitNoteStandardLabel(label: UILabel) {
    
        label.backgroundColor = .white
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        label.layer.borderColor = SplitNotePurple.cgColor
        label.layer.borderWidth = 2.0
    
    }
    
    @IBAction func enterText(_ sender: Any?) {
        
        transcription.text = transcription.text ?? "" + " Selected"
        
    }
    
}
