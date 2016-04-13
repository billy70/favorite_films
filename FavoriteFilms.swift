//
//  FavoriteFilms.swift
//  fav_films
//
//  Created by William L. Marr III on 4/13/16.
//  Copyright © 2016 William L. Marr III. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class FavoriteFilms: NSManagedObject {

    func getImageForFilm() -> UIImage {
        guard (self.filmImage != nil) else {
            return UIImage(contentsOfFile: "Film_Favs_Logo")!
        }
        
        if let image = UIImage(data: self.filmImage!) {
            return image
        } else {
            return UIImage()
        }
    }
    
    func setImageForFilm(image: UIImage) {
        let data = UIImagePNGRepresentation(image)
        self.filmImage = data
    }
}
