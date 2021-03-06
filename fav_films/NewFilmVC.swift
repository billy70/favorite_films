//
//  NewFilmVC.swift
//  fav_films
//
//  Created by William L. Marr III on 4/13/16.
//  Copyright © 2016 William L. Marr III. All rights reserved.
//

import UIKit
import CoreData

class NewFilmVC: UIViewController {

    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var filmTitle: UITextField!
    @IBOutlet weak var filmDescription: UITextView!
    @IBOutlet weak var filmPlot: UITextView!
    @IBOutlet weak var filmLink: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        filmTitle.text = ""
        filmDescription.text = ""
        filmPlot.text = ""
        filmLink.text = ""
        
        filmImage.layer.cornerRadius = 5.0
        filmImage.clipsToBounds = true
        
        loadImagePicker()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        if let title = filmTitle.text where title != "",
            let description = filmDescription.text where description != "",
            let plot = filmPlot.text where plot != "",
            let link = filmLink.text where link != "" {
                
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("FavoriteFilms", inManagedObjectContext: context)!
            let film = FavoriteFilms(entity: entity, insertIntoManagedObjectContext: context)

            film.filmTitle = title
            film.filmDescription = description
            film.filmPlot = plot
            film.filmLink = link
            film.setImageForFilm(filmImage.image!)
                
            context.insertObject(film)
            
            // This do-try-catch block attempts to persist the data.
            do {
                try context.save()
            } catch {
                print("Could not save favorite film!")
            }
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func imageTapped(sender: UIGestureRecognizer) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
}


extension NewFilmVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func loadImagePicker() {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        filmImage.image = image
    }
}
