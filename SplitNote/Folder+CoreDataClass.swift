//
//  Folder+CoreDataClass.swift
//  SplitNote
//
//  Created by Brendan Krekeler on 10/13/18.
//  Copyright © 2018 teamSplitNote. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Folder)
public class Folder: NSManagedObject {
    var notes: [Note]? {
        return self.rawNote?.array as? [Note]
    }
    
    convenience init? (title: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext
            else {
                return nil
        }
        
        self.init(entity: Folder.entity(), insertInto: context)
        
        self.title = title
    }
}
