//
//  ViewController.swift
//  FacebookLoginA1
//
//  Created by admin on 6/27/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit


class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (FBSDKAccessToken.currentAccessToken() == nil) {
            print("NOT ")
        } else {
            print("Login")
        }
        
        var loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = self.view.center
        loginButton.delegate = self
        
        self.view.addSubview(loginButton)
        // Do any additional setup after loading the view, typically from a nib.
    }

    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error == nil {
            getUserData()
            print("Login Complete.")
            self.performSegueWithIdentifier("showNew", sender: self)
            
        
        } else {
            print(error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User logged out...")
    }
    
    func getUserData() {
        if((FBSDKAccessToken.currentAccessToken()) != nil) {
            if((FBSDKAccessToken.currentAccessToken()) != nil) {
                FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, email, picture.type(large)"]).startWithCompletionHandler({ (connection, result, error) -> Void in
                    if (error == nil) {
                        print(result)
                    } else {
                        print("ERROR")
                    }
                })
                
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

