//
//  Note+CoreDataClass.swift
//  SplitNote
//
//  Created by Brendan Krekeler on 10/13/18.
//  Copyright © 2018 teamSplitNote. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Note)
public class Note: NSManagedObject {
    var date: Date? {
        get {
            return rawDate as Date?
        }
        set {
            rawDate = newValue as NSDate?
        }
    }
    
    convenience init?(audioID: String?, notes: String?, date: Date?, title: String?, transcriptedText: String?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Note.entity(), insertInto: context)
        
        self.audioID = audioID
        self.notes = notes
        self.date = date
        self.title = title
        self.transcriptedText = transcriptedText
        
        
    }
}
