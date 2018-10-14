//
//  folderCell.swift
//  SplitNote
//
//  Created by Nick J Grove on 10/13/18.
//  Copyright © 2018 teamSplitNote. All rights reserved.
//

import UIKit

class FolderCell: UITableViewCell {
    
    @IBOutlet var testTextLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        
        testTextLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width/2, height: 50))
        testTextLabel.text = "Click Me!"
        testTextLabel.textColor = .black
        testTextLabel.textAlignment = NSTextAlignment.left
        testTextLabel.font = UIFont(name: "Helvetica-Ultralight", size: 20)
        
        addSubview(testTextLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
