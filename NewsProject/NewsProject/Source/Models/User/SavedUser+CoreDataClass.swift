//
//  SavedUser+CoreDataClass.swift
//  NewsProject
//
//  Created by Yurii Sushko on 21.01.2018.
//  Copyright © 2018 Yurii Sushko. All rights reserved.
//
//

import Foundation
import CoreData

public class SavedUser: NSManagedObject {
    
    // MARK: Public Class Methods
    
    class func check(user: User, in context: NSManagedObjectContext) -> Bool {
        let request: NSFetchRequest<SavedUser> = SavedUser.fetchRequest()
        if let login = user.login {
            request.predicate = NSPredicate(format: "login = %@", login)
            let result = try? context.fetch(request)
            
            return result?.first?.password == user.password ? true : false
        }
        
        return false
    }
    
    class func createOrFind(user: User, in context: NSManagedObjectContext) -> SavedUser? {
        let request: NSFetchRequest<SavedUser> = SavedUser.fetchRequest()
        if let login = user.login {
            request.predicate = NSPredicate(format: "login = %@", login)
            let result = try? context.fetch(request)
            if let result = result {
                if result.count > 0 {
                    return result[0]
                }
            }
        }
        
        return fill(with: user, in: context)
   
    }
    
    // MARK: Private Methods
    
    private class func fill(with user: User,in context: NSManagedObjectContext ) -> SavedUser? {
        let entity = NSEntityDescription.entity(forEntityName: "SavedUser", in: context)
        if let entity = entity {
            let savedUser = SavedUser(entity: entity, insertInto: context)
            savedUser.name = user.name
            savedUser.surname = user.surname
            savedUser.email = user.email
            savedUser.login = user.login
            savedUser.password = user.password
            
            try? context.save()
            
            return savedUser
        }
        
        return nil
    }

}
