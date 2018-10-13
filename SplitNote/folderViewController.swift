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
        
        navigationItem.title = "Folders"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.rightBarButtonItem = add
        
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
    
}
