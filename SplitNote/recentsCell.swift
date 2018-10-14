//
//  recentsCell.swift
//  SplitNote
//
//  Created by Nick J Grove on 10/13/18.
//  Copyright © 2018 teamSplitNote. All rights reserved.
//

import UIKit

class RecentsCell: UITableViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var duration: UILabel!
    @IBOutlet var date: UILabel!
    
    var SplitNoteDarkPurple = UIColor(displayP3Red: 66/255, green: 39/255, blue: 90/255, alpha: 1.0)
    var SplitNoteLightPurple = UIColor(displayP3Red: 115/255, green: 75/255, blue: 109/255, alpha: 1.0)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        
        title = UILabel(frame: CGRect(x: 10, y: 0, width: frame.width/2, height: 50))
        title.textColor = SplitNoteDarkPurple
        title.textAlignment = NSTextAlignment.left
        title.font = UIFont(name: "Helvetica-Ultralight", size: 20)
        
//        duration = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width/2, height: 50))
//        duration.textColor = .lightGray
//        duration.textAlignment = NSTextAlignment.center
//        duration.font = UIFont(name: "Helvetica-Ultralight", size: 20)
        
        date = UILabel(frame: CGRect(x: frame.width/2, y: 0, width: (frame.width/2)-10, height: 50))
        date.textColor = SplitNoteLightPurple
        date.textAlignment = NSTextAlignment.right
        date.font = UIFont(name: "Helvetica-Ultralight", size: 20)
        
        addSubview(title)
        //addSubview(duration)
        addSubview(date)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
