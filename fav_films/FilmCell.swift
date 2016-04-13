//
//  FilmCell.swift
//  fav_films
//
//  Created by William L. Marr III on 4/13/16.
//  Copyright © 2016 William L. Marr III. All rights reserved.
//

import UIKit

class FilmCell: UITableViewCell {

    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var filmDescription: UILabel!
    @IBOutlet weak var filmLink: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
