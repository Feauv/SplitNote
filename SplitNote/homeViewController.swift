//
//  ViewController.swift
//  SplitNote
//
//  Created by Nathaniel Banderas on 10/12/18.
//  Copyright © 2018 teamSplitNote. All rights reserved.
//

import UIKit

class homeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var new: UIButton!
    @IBOutlet var open: UIButton!
    
    @IBOutlet var recents: UITableView!
    @IBOutlet var homeView: UIView!
    
    let cellId = "cellId"
    
    private lazy var gradient: CAGradientLayer = {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(displayP3Red: 66/255, green: 39/255, blue: 90/255, alpha: 1.0).cgColor,UIColor(displayP3Red: 115/255, green: 75/255, blue: 109/255, alpha: 1.0).cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.frame = view.bounds
        return gradientLayer
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let x = (view.frame.width/2) - 45
        let y = (view.frame.height - 200)/2
        
        let centerImage: UIImageView = {
            
            let cI = UIImageView(frame: CGRect(x: x, y: y - 50, width: 100, height: 120))
            cI.image = UIImage(named: "mainIconWhite")
            return cI
        }()
        
        setupConstComponents()
        setupRecentsView()
        
        self.homeView.addSubview(centerImage)
        
    }
    
    private func setupConstComponents() {
        
        homeView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        homeView.layer.insertSublayer(gradient, at: 0)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: 100))
        titleLabel.text = "SplitNote"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.init(name: "HelveticaNeue-Bold", size: 40)
        titleLabel.textAlignment = NSTextAlignment.center
        
        new = UIButton(frame: CGRect(x: 50, y: ((view.frame.height*2)/3) - 60, width: view.frame.width - 100, height: 50))
        new.setTitle("New", for: [])
        new.setTitleColor(UIColor(displayP3Red: 115/255, green: 75/255, blue: 109/255, alpha: 1.0), for: [])
        new.backgroundColor = UIColor.white
        new.layer.cornerRadius = 25
        new.addTarget(self, action: #selector(newNote(_:)), for: .touchUpInside)
        
        open = UIButton(frame: CGRect(x: 50, y: (view.frame.height*2)/3, width: view.frame.width - 100, height: 50))
        open.setTitle("Open", for: [])
        open.setTitleColor(UIColor(displayP3Red: 115/255, green: 75/255, blue: 109/255, alpha: 1.0), for: [])
        open.backgroundColor = UIColor.white
        open.layer.cornerRadius = 25
        open.addTarget(self, action: #selector(openFolders(_:)), for: .touchUpInside)
        
        view.addSubview(homeView)
        view.addSubview(new)
        view.addSubview(open)
        view.addSubview(titleLabel)
        
    }
    
    private func setupRecentsView() {
        
        recents = UITableView(frame: CGRect(x: 50, y: ((view.frame.height*2)/3) + 100, width: view.frame.width - 100, height: 150))
        recents.register(RecentsCell.self, forCellReuseIdentifier: "cellId")
        recents.layer.cornerRadius = 8
        recents.rowHeight = 50
        recents.dataSource = self
        recents.delegate = self
        view.addSubview(recents)
        
    }

    @IBAction func newNote(_ sender: Any?) {
        print("New Recording Started")
        self.present(UINavigationController(rootViewController: NewNoteViewController()), animated: true, completion: nil)
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destination = segue.destination as! NewNoteViewController
//    }
    
    @IBAction func openFolders(_ sender: Any?) {
        print("Opening Folders")
        self.present(UINavigationController(rootViewController: FolderViewController()), animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("You selected one of your notes")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath as IndexPath)
        return cell
    }
    
    
    
}

