//
//  MainSceneVC.swift
//  fav_films
//
//  Created by William L. Marr III on 4/12/16.
//  Copyright © 2016 William L. Marr III. All rights reserved.
//

import UIKit
import CoreData

class MainSceneVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var films: [FavoriteFilms] = [FavoriteFilms]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchAndSetResults()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            let filmDetailsVC = segue.destinationViewController as! FilmDetailsVC
            
            if let selectedFilmCell = sender as? FilmCell {
                let indexPath = tableView.indexPathForCell(selectedFilmCell)!
                let selectedFilm = films[indexPath.row]
                filmDetailsVC.film = selectedFilm
            }
        }
    }

    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "FavoriteFilms")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.films = results as! [FavoriteFilms]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
}

extension MainSceneVC: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
}

extension MainSceneVC: UITableViewDelegate {

    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        print("selected row")
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        guard (indexPath.row < films.count) else {
            return FilmCell()
        }
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("filmCell") as? FilmCell {
            cell.configureCell(films[indexPath.row])
            return cell
        } else {
            return FilmCell()
        }
    }
}
