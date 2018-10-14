//
//  Folder+CoreDataProperties.swift
//  SplitNote
//
//  Created by Brendan Krekeler on 10/13/18.
//  Copyright © 2018 teamSplitNote. All rights reserved.
//
//

import Foundation
import CoreData


extension Folder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Folder> {
        return NSFetchRequest<Folder>(entityName: "Folder")
    }

    @NSManaged public var title: String?
    @NSManaged public var rawNote: NSOrderedSet?

}

extension Folder {
    
    @objc(insertObject:inRawNoteAtIndex:)
    @NSManaged public func insertIntoRawNote(_ value: Note, at idx: Int)
    
    @objc(removeObjectFromRawNoteAtIndex:)
    @NSManaged public func removeFromRawNote(at idx: Int)
    
    @objc(insertRawNote:atIndexes:)
    @NSManaged public func insertIntoRawNote(_ values: [Note], at indexes: NSIndexSet)
    
    @objc(removeRawNoteAtIndexes:)
    @NSManaged public func removeFromRawNote(at indexes: NSIndexSet)
    
    @objc(replaceObjectInRawNoteAtIndex:withObject:)
    @NSManaged public func replaceRawNote(at idx: Int, with value: Note)
    
    @objc(replaceRawNoteAtIndexes:withRawNote:)
    @NSManaged public func replaceRawNote(at indexes: NSIndexSet, with values: [Note])
    
    @objc(addRawNoteObject:)
    @NSManaged public func addToRawNote(_ value: Note)
    
    @objc(removeRawNoteObject:)
    @NSManaged public func removeFromRawNote(_ value: Note)
    
    @objc(addRawNote:)
    @NSManaged public func addToRawNote(_ values: NSOrderedSet)
    
    @objc(removeRawNote:)
    @NSManaged public func removeFromRawNote(_ values: NSOrderedSet)
}
