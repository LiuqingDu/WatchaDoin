//
//  SigninViewController.swift
//  WatchaDoin
//
//  Created by Liuqing Du on 15/7/17.
//  Copyright © 2015年 JuneDesign. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController {
    
    let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate

    @IBAction func signinSharlee(sender: AnyObject) {
        appDelegate?.cur = appDelegate?.Sharlee
        appDelegate?.tar = appDelegate?.Tong
        
        performSegueWithIdentifier("segueToConversationViewController", sender: self)
    }
    
    @IBAction func signinTong(sender: AnyObject) {
        appDelegate?.cur = appDelegate?.Tong
        appDelegate?.tar = appDelegate?.Sharlee
        
        performSegueWithIdentifier("segueToConversationViewController", sender: self)
    }
    
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

}
