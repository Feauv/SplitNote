//
//  Note+CoreDataProperties.swift
//  SplitNote
//
//  Created by Brendan Krekeler on 10/13/18.
//  Copyright © 2018 teamSplitNote. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var rawDate: NSDate?
    @NSManaged public var title: String?
    @NSManaged public var transcriptedText: String?
    @NSManaged public var notes: String?
    @NSManaged public var folder: Folder?

}
