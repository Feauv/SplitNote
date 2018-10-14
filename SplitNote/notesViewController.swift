//
//  notesViewController.swift
//  SplitNote
//
//  Created by Nick J Grove on 10/13/18.
//  Copyright © 2018 teamSplitNote. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var notes: UITableView!
    
    var SplitNoteDarkPurple = UIColor(displayP3Red: 66/255, green: 39/255, blue: 90/255, alpha: 1.0)
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupNavigationBarItems()
        setupTableView()
        setupNotesHeaderView()
        
    }
    
    private func setupNavigationBarItems() {
        
        navigationController?.navigationBar.barTintColor = SplitNoteDarkPurple
        
        navigationItem.title = "Notes"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.rightBarButtonItem = add
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false;
        
    }
    
    private func setupTableView() {
        
        notes = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        notes.register(NoteCell.self, forCellReuseIdentifier: "cellId")
        notes.rowHeight = 50
        notes.dataSource = self
        notes.delegate = self
        view.addSubview(notes)
        
    }
    
    private func setupNotesHeaderView() {
        
        view.addSubview(notesHeader)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: notesHeader)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: notesHeader)
        
    }
    
    let add: UIBarButtonItem = {
        
        let a = UIBarButtonItem()
        a.title = "ADD"
        a.tintColor = .white
        return a
        
    }()
    
    let notesHeader: NotesHeaderView = {
        
        let nH = NotesHeaderView()
        return nH
        
    }()
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected one of your notes")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! NoteCell
        
        return cell
    }

}
