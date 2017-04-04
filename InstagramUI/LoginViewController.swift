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
    var loginButton: FBSDKLoginButtonDelegate = FBSDKLoginButton() as! FBSDKLoginButtonDelegate
    

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let loginButton = FBSDKLoginButton()
        // Optional: Place the button in the center of your view.
        loginButton.center = view.center
        loginButton.delegate = self
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        view.addSubview(loginButton)
        
    }

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        print("User logged in")
        return
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
        print("User logged out")
        return
    }
}
