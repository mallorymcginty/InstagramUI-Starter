//
//  LoginViewController.swift
//  InstagramUI
//
//  Created by Ivor D. Addo, PhD on 4/4/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit



class LoginViewController: UIViewController, FBSDKLoginButtonDelegate
{
    var loginButton: FBSDKLoginButton = FBSDKLoginButton()
  
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

       
        // Optional: Place the button in the center of your view.
        loginButton.center = view.center
        loginButton.delegate = self
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        self.view!.addSubview(loginButton)
        
    }

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print(error.localizedDescription)
        print("User logged in")
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tab")
        self.present(vc!, animated: true, completion: nil)
        
        return
    }
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
        print("User logged out")
        return
    }
}
