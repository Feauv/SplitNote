//
//  folderViewController.swift
//  SplitNote
//
//  Created by Nick J Grove on 10/13/18.
//  Copyright © 2018 teamSplitNote. All rights reserved.
//

import UIKit

class FolderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var folders: UITableView!
    
    let cellId = "cellId"
    
    var SplitNoteDarkPurple = UIColor(displayP3Red: 66/255, green: 39/255, blue: 90/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupNavigationBarItems()
        setupTableView()
        setupFoldersHeaderView()
        
    }
    
    private func setupNavigationBarItems() {
        
        navigationController?.navigationBar.barTintColor = SplitNoteDarkPurple
        
        navigationItem.title = "FOLDERS"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let createFolder = UIBarButtonItem(title: "ADD", style: .done, target: self, action: #selector(addFolder))
        
        createFolder.tintColor = .white
        
        navigationItem.rightBarButtonItem = createFolder
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false;
        
    }
    
    private func setupTableView() {
        
        folders = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        folders.register(FolderCell.self, forCellReuseIdentifier: "cellId")
        folders.rowHeight = 50
        folders.dataSource = self
        folders.delegate = self
        view.addSubview(folders)
        
    }
    
    private func setupFoldersHeaderView() {
        
        view.addSubview(foldersHeader)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: foldersHeader)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: foldersHeader)
        
    }
    
    let add: UIBarButtonItem = {
        
        let a = UIBarButtonItem()
        a.title = "ADD"
        a.tintColor = .white
        return a
        
    }()
    
    let foldersHeader: FoldersHeaderView = {
        
        let fH = FoldersHeaderView()
        return fH
        
    }()
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected one of your notes")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        return cell
    }
    
    @objc func addFolder(){
        
        let alert = UIAlertController(title: "Create a New Folder", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input the title here..."
        })
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { action in
            
            if let name = alert.textFields?.first?.text {
                print("Your name: \(name)")
            }
        }))
        
        self.present(alert, animated: true)

    }
    
}
