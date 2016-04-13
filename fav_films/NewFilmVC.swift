//
//  NewFilmVC.swift
//  fav_films
//
//  Created by William L. Marr III on 4/13/16.
//  Copyright © 2016 William L. Marr III. All rights reserved.
//

import UIKit

class NewFilmVC: UIViewController {

    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var filmTitle: UITextField!
    @IBOutlet weak var filmDescription: UITextView!
    @IBOutlet weak var filmPlot: UITextView!
    @IBOutlet weak var filmLink: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
    }
    
}
