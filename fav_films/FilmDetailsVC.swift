//
//  FilmDetailsVC.swift
//  fav_films
//
//  Created by William L. Marr III on 4/13/16.
//  Copyright © 2016 William L. Marr III. All rights reserved.
//

import UIKit

class FilmDetailsVC: UIViewController {
    
    var film: FavoriteFilms!

    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var filmDescription: UILabel!
    @IBOutlet weak var filmPlot: UILabel!
    @IBOutlet weak var filmLink: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let film = film {
            filmTitle.text = film.filmTitle
            filmDescription.text = film.filmDescription
            filmLink.text = film.filmLink
            filmPlot.text = film.filmPlot
            filmImage.image = film.getImageForFilm()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doneButtonTapped(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
}
