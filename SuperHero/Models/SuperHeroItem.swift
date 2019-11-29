//
//  SuperHeroItem.swift
//  SuperHero
//
//  Created by Gerson Padilla Ramos on 11/28/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation
import CoreData

public class SuperHeroItem:NSManagedObject, Identifiable {
    @NSManaged public var createdAt:Date?
    @NSManaged public var id:NSNumber?
    @NSManaged public var mention:String?
    @NSManaged public var name:String?
}

extension SuperHeroItem {
    static func getAllSuperHeroItems() -> NSFetchRequest<SuperHeroItem> {
        let request:NSFetchRequest<SuperHeroItem> = SuperHeroItem.fetchRequest() as! NSFetchRequest<SuperHeroItem>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}

