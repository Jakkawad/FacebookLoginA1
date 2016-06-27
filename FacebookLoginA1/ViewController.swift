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
import FBSDKShareKit

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
            //postTimeline()
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
    
    func postTimeline() {
        let content:FBSDKShareLinkContent = FBSDKShareLinkContent()
        content.contentURL = NSURL(string: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfp1/v/t1.0-1/p200x200/11007728_931593790194205_447890577362865019_n.jpg?oh=8f267d80b182b55d04b56277ae95d30c&oe=580C29F3&__gda__=1475053929_2306230052f4a32c6dd3faace9e1216d")
        content.contentTitle = "Content Title"
        content.contentDescription = "Content Description"
        content.imageURL = NSURL(string: "https://developers.facebook.com/docs/ios/graph")
        print("POST")
        let button:FBSDKShareButton = FBSDKShareButton()
        button.shareContent = content
        button.center = self.view.center
        self.view.addSubview(button)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

