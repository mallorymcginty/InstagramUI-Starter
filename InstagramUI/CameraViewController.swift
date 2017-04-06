//
//  CameraViewController.swift
//  InstagramUI
//
//  Created by Ivor D. Addo, PhD on 4/4/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth





class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    let storage = FIRStorage.storage()
    //let picRef = FIRStorage.child()
    
    
    
    
    @IBOutlet weak var imgPhoto: UIImageView!
    
    
    
    
    @IBAction func btnSavePhoto(_ sender: UIBarButtonItem)
    {
        /* var ref: FIRDatabaseReference!
        let user = FIRAuth.auth()?.currentUser 
        ref = FIRDatabase.database().reference()
         let uid = user?.uid
        
       
        
        let post : [String : Any] =
            ["photo": imgPhoto.image!]
        
        //Adds FB JSON node for incidentLog
        
        //SET FOR CURRENT USER
        ref.child("posts").childByAutoId().setValue(post)
        
        imgPhoto.image = nil
       
    
        
        
        //transition to post controller with image shown
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "post")
        self.present(vc!, animated: true, completion: nil)
        
        //Get image in the image view and save it
         let imageData = UIImageJPEGRepresentation(imgPhoto.image!, 0.6)
        let compressedJPEGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPEGImage!, nil, nil, nil)*/
        
        
    
    
    func uploadImageToFirebaseStorage(data: NSData)
    {
       let storageRef = FIRStorage.storage().reference()
        let  uploadMetadata = FIRStorageMetadata()
        uploadMetadata.contentType = "image/jpeg"
        storageRef.put(data as Data, metadata: uploadMetadata)
        {
            (metadata, error) in
            if (error != nil)
            {
                print("Metadata error \(error?.localizedDescription)")
            }
            else
            {
                print(" Here is some metadata \(metadata)")
            }
        }
        
    }
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "post")
        self.present(vc!, animated: true, completion: nil)
}
    
    @IBAction func btnTakePhoto(_ sender: UIButton)
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            let imgPicker = UIImagePickerController()
            imgPicker.delegate = self
            imgPicker.sourceType = .camera
            imgPicker.allowsEditing = false
            
            self.present(imgPicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnChoosePhoto(_ sender: UIButton)
    {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        {
            let imgPicker = UIImagePickerController()
            imgPicker.delegate = self
            imgPicker.sourceType = .photoLibrary
            imgPicker.allowsEditing = true
            
            self.present(imgPicker, animated: true, completion: nil)
        }
    }
    
    
    func  imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject: AnyObject]!)
    {
    imgPhoto.image = image
    self.dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }

   
}
