//
//  folderCell.swift
//  SplitNote
//
//  Created by Nick J Grove on 10/13/18.
//  Copyright © 2018 teamSplitNote. All rights reserved.
//

import UIKit

class FolderCell: UITableViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var numOfFiles: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        
        title = UILabel(frame: CGRect(x: 0+10, y: 0, width: frame.width/2, height: 50))
        title.textColor = .black
        title.textAlignment = NSTextAlignment.left
        title.font = UIFont(name: "Helvetica-Ultralight", size: 20)
        
        numOfFiles = UILabel(frame: CGRect(x: frame.width/2, y: 0, width: frame.width/2, height: 50))
        numOfFiles.textColor = .lightGray
        numOfFiles.textAlignment = NSTextAlignment.right
        numOfFiles.font = UIFont(name: "Helvetica-Ultralight", size: 20)
        
        addSubview(title)
        addSubview(numOfFiles)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
