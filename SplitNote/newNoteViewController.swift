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
    @IBOutlet var userMessage: UILabel!
    
    @IBOutlet var enterFlagText: UIButton!
    @IBOutlet var record: UIButton!
    @IBOutlet var flag: UIButton!
    
    @IBOutlet var newNoteView: UIView!
    @IBOutlet var divider: UIView!
    @IBOutlet var recordingInterface: UIView!
    
    var recordingBool = false
    
    var SplitNoteDarkPurple = UIColor(displayP3Red: 66/255, green: 39/255, blue: 90/255, alpha: 1.0)
    var SplitNoteLightPurple = UIColor(displayP3Red: 115/255, green: 75/255, blue: 109/255, alpha: 1.0)
    //var StandardLightGray = UIColor(displayP3Red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
    
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
        
        newNoteView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: (view.frame.height*4.5)/8))
        newNoteView.layer.insertSublayer(gradient, at: 0)
        
        recordingInterface = UIView(frame: CGRect(x: 0, y: (view.frame.height*4.5)/8, width: view.frame.width, height: (view.frame.height*3.5)/8))
        recordingInterface.backgroundColor = .white
        
        transcription = UILabel(frame: CGRect(x: 40, y: view.frame.height/16, width: view.frame.width - 80, height: 250))
        setSplitNoteStandardLabel(label: transcription)
        transcription.layer.borderColor = UIColor.lightGray.cgColor
        transcription.layer.borderWidth = 1.0
        
        flagLabel = UILabel(frame: CGRect(x: 40, y: view.frame.height - 230, width: view.frame.width - 160, height: 120))
        setSplitNoteStandardLabel(label: flagLabel)
        flagLabel.layer.borderColor = SplitNoteLightPurple.cgColor
        flagLabel.layer.borderWidth = 1.5
        
        userMessage = UILabel(frame: CGRect(x: 40, y: 10, width: view.frame.width - 80, height: 30))
        userMessage.textColor = .white
        userMessage.font = UIFont(name: "Helvetica-Light", size: 22)
        userMessage.textAlignment = NSTextAlignment.center
        
        enterFlagText = UIButton(frame: CGRect(x: view.frame.width - 110, y: view.frame.height - 210, width: 80, height: 80))
        enterFlagText.setTitle("Enter", for: [])
        enterFlagText.setTitleColor(SplitNoteLightPurple, for: [])
        enterFlagText.backgroundColor = .white
        enterFlagText.layer.cornerRadius = 40
        enterFlagText.layer.borderColor = SplitNoteLightPurple.cgColor
        enterFlagText.layer.borderWidth = 1.0
        enterFlagText.addTarget(self, action: #selector(enterText(_:)), for: .touchUpInside)
        
        record = UIButton(frame: CGRect(x: 60, y: (view.frame.height*4.5/8) + 30, width: 80, height: 80))
        record.setTitle("RECORD", for: [])
        record.setTitleColor(.red, for: [])
        record.backgroundColor = .clear
        record.layer.cornerRadius = 40
        record.layer.borderColor = UIColor.red.cgColor
        record.layer.borderWidth = 1.0
        record.addTarget(self, action: #selector(recordSpeech(_:)), for: .touchUpInside)
        
        flag = UIButton(frame: CGRect(x: view.frame.width - 140, y: (view.frame.height*4.5/8) + 30, width: 80, height: 80))
        flag.setTitle("FLAG", for: [])
        flag.setTitleColor(UIColor(displayP3Red: 242/255, green: 208/255, blue: 23/255, alpha: 1.0), for: [])
        flag.backgroundColor = .clear
        flag.layer.cornerRadius = 40
        flag.layer.borderColor = UIColor(displayP3Red: 255/255, green: 215/255, blue: 0/255, alpha: 1.0).cgColor
        flag.layer.borderWidth = 1.0
        flag.addTarget(self, action: #selector(flagSpeech(_:)), for: .touchUpInside)
        
        /*divider = UIView(frame: CGRect(x: 0, y: (view.frame.height*4.5/8) - 2, width: view.frame.width, height: 2))
        divider.backgroundColor = SplitNotePurple*/
        
        view.addSubview(newNoteView)
        view.addSubview(recordingInterface)
        
        view.addSubview(transcription)
        view.addSubview(flagLabel)
        view.addSubview(userMessage)
        
        view.addSubview(enterFlagText)
        view.addSubview(record)
        view.addSubview(flag)
        //view.addSubview(divider)
        
    }
    
    private func setupNavigationBarItems() {
        
        navigationController?.navigationBar.barTintColor = SplitNoteDarkPurple
        
        navigationItem.title = "SplitNote"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.leftBarButtonItem = home
        navigationItem.rightBarButtonItem = files
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false;
        
    }
    
    private func setSplitNoteStandardLabel(label: UILabel) {
    
        label.backgroundColor = UIColor(white: 1.0, alpha: 0.25)
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
    
    }
    
    let home: UIBarButtonItem = {
        
        let h = UIBarButtonItem()
        h.title = "HOME"
        h.tintColor = .white
        return h
        
    }()
    
    let files: UIBarButtonItem = {
        
        let f = UIBarButtonItem()
        f.title = "FILES"
        f.tintColor = .white
        return f
        
    }()
    
    @IBAction func enterText(_ sender: Any?) {
        
        transcription.text = transcription.text ?? "" + " Selected"
        
    }
    
    @IBAction func recordSpeech(_ sender: Any?) {

        recordingBool = !recordingBool
        
        if (recordingBool) {
            userMessage.text = "Recording..."
        } else {
            userMessage.text = ""
        }
        
    }
    
    @IBAction func flagSpeech(_ sender: Any?) {
        

        
    }
    
}
