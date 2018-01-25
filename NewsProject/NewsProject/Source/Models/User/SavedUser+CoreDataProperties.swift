//
//  SavedUser+CoreDataProperties.swift
//  NewsProject
//
//  Created by Yurii Sushko on 21.01.2018.
//  Copyright © 2018 Yurii Sushko. All rights reserved.
//
//

import Foundation
import CoreData


extension SavedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedUser> {
        return NSFetchRequest<SavedUser>(entityName: "SavedUser")
    }

    @NSManaged public var email: String?
    @NSManaged public var login: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var surname: String?

}
