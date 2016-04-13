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
        
        tableView.dataSource = self
        tableView.delegate = self
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

extension MainSceneVC: UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
