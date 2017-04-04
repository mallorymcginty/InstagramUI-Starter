//
//  CameraViewController.swift
//  InstagramUI
//
//  Created by Ivor D. Addo, PhD on 4/4/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    @IBOutlet weak var imgPhoto: UIImageView!
    
    @IBAction func btnSavePhoto(_ sender: UIBarButtonItem)
    {
        //Get image in the image view and save it 
        let imageData = UIImageJPEGRepresentation(imgPhoto.image!, 0.6)
        let compressedJPEGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPEGImage!, nil, nil, nil)
        
        //transition to post controller with image shown
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
    
    
    func  imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo image: UIImage!, editingInfo: [NSObject: AnyObject]!)
    {
    imgPhoto.image = image
    self.dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

   
}
