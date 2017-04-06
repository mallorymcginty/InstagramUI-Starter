//
//  NewPostViewController.swift
//  InstagramUI
//
//  Created by Ivor D. Addo, PhD on 4/4/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class NewPostViewController: UITableViewController
{

    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var txtCaption: UITextField!
    @IBOutlet weak var btnSharePost: UIBarButtonItem!
    
    
    
    @IBAction func btnSharePost(_ sender: UIBarButtonItem)
    {
        var ref: FIRDatabaseReference!
        let user = FIRAuth.auth()?.currentUser
        let uid = user?.uid
        
        ref = FIRDatabase.database().reference()
        
        let post : [String : Any] =
            ["caption": txtCaption.text!,
             "userID": uid!]
        
        //Adds FB JSON node for incidentLog
        ref.child("posts").childByAutoId().setValue(post)
        
        txtCaption.text = nil
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "newsfeed")
        self.present(vc!, animated: true, completion: nil)
    }
    
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Attempting to set the UIImageView to the image previously uploaded
        //imgImage = FIRStorage().reference()
        
    }
    

}
