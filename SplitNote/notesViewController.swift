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
        
        let createNote = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addNote))
        
        let returnToFolders = UIBarButtonItem(title: "Folders", style: .done, target: self, action: #selector(goToFolders))
        
        createNote.tintColor = .white
        returnToFolders.tintColor = .white
        
        navigationItem.rightBarButtonItem = createNote
        navigationItem.leftBarButtonItem = returnToFolders
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false;
        
    }
    
    private func setupTableView() {
        
        notes = UITableView(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height))
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
    
    @objc func goToFolders() {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func addNote() {
        
        navigationController?.pushViewController(NewNoteViewController(), animated: true)
        
    }
    
    let notesHeader: NotesHeaderView = {
        
        let nH = NotesHeaderView()
        return nH
        
    }()
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.present(UINavigationController(rootViewController: NoteDetailViewController()), animated: true, completion: nil)
        print("You selected one of your notes")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    let titles = ["Interview 2", "Meeting 2", "Conference Call 1", "Interview 1", "Meeting 1"]
    let durations = ["21:30", "43:09", "1:05:54", "34:23", "55:04"]
    let dates = ["10/14/20", "10/13/20", "10/13/20", "10/12/20", "10/11/20"]

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! NoteCell
        
        cell.title.text = titles[indexPath.row]
        cell.duration.text = durations[indexPath.row]
        cell.date.text = dates[indexPath.row]
        
        return cell
    }

}
