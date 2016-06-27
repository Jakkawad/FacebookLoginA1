//
//  DetailViewController.swift
//  FacebookLoginA1
//
//  Created by admin on 6/27/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import FBSDKShareKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnShare(sender: AnyObject) {
        let content:FBSDKShareLinkContent = FBSDKShareLinkContent()
        content.contentURL = NSURL(string: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfp1/v/t1.0-1/p200x200/11007728_931593790194205_447890577362865019_n.jpg?oh=8f267d80b182b55d04b56277ae95d30c&oe=580C29F3&__gda__=1475053929_2306230052f4a32c6dd3faace9e1216d")
        content.contentTitle = "Content Title"
        content.contentDescription = "Content Description"
        content.imageURL = NSURL(string: "http://appamatix.techmakaillc.netdna-cdn.com/wp-content/uploads/2015/07/dog-funny-face-weird-3453-450x299.jpg")
        let button = FBSDKShareButton()
        button.center = self.view.center
        button.shareContent = content
        view.addSubview(button)
        print("POST")
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
