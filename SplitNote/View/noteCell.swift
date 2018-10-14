//
//  noteCell.swift
//  SplitNote
//
//  Created by Nick J Grove on 10/13/18.
//  Copyright © 2018 teamSplitNote. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var duration: UILabel!
    @IBOutlet var date: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        
        title = UILabel(frame: CGRect(x: 10, y: 0, width: frame.width/3, height: 50))
        title.textColor = .black
        title.textAlignment = NSTextAlignment.left
        title.font = UIFont(name: "Helvetica-Ultralight", size: 20)
        
        duration = UILabel(frame: CGRect(x: frame.width/2, y: 0, width: frame.width/3, height: 50))
        duration.textColor = .lightGray
        duration.textAlignment = NSTextAlignment.center
        duration.font = UIFont(name: "Helvetica-Ultralight", size: 20)
        
        date = UILabel(frame: CGRect(x: frame.width, y: 0, width: (frame.width/3)-30, height: 50))
        date.textColor = .lightGray
        date.textAlignment = NSTextAlignment.right
        date.font = UIFont(name: "Helvetica-Ultralight", size: 20)
        
        addSubview(title)
        addSubview(duration)
        addSubview(date)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
