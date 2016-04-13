//
//  FavoriteFilms+CoreDataProperties.swift
//  fav_films
//
//  Created by William L. Marr III on 4/13/16.
//  Copyright © 2016 William L. Marr III. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension FavoriteFilms {

    @NSManaged var filmTitle: String?
    @NSManaged var filmDescription: String?
    @NSManaged var filmLink: String?
    @NSManaged var filmImage: NSData?

}
