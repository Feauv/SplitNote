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
    @NSManaged public var rawNote: Note?

}
