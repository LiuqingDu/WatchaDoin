//
//  ConversationListViewController.swift
//  WatchaDoin
//
//  Created by Liuqing Du on 15/7/13.
//  Copyright © 2015年 JuneDesign. All rights reserved.
//

import UIKit

class ConversationListViewController: RCConversationListViewController {
    
    let conversationViewController = RCConversationViewController()
    let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        appDelegate?.connectToServer({ () -> Void in
            
            self.setDisplayConversationTypes([
                RCConversationType.ConversationType_APPSERVICE.rawValue,
                RCConversationType.ConversationType_CHATROOM.rawValue,
                RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
                RCConversationType.ConversationType_DISCUSSION.rawValue,
                RCConversationType.ConversationType_GROUP.rawValue,
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
                RCConversationType.ConversationType_SYSTEM.rawValue
                ])
            
            self.refreshConversationTableViewIfNeeded()
        })
    }
    
    @IBAction func compose(sender: AnyObject) {
        
        conversationViewController.targetId = appDelegate?.tar[0]
        conversationViewController.userName = appDelegate?.tar[0]
        conversationViewController.conversationType = RCConversationType.ConversationType_PRIVATE
        conversationViewController.title = appDelegate?.tar[0]
        
        performSegueWithIdentifier("segueToConversationViewController", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController!.tabBar.hidden = false
        self.refreshConversationTableViewIfNeeded()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let destinationViewController = segue.destinationViewController as? RCConversationViewController
        
        destinationViewController?.targetId = conversationViewController.targetId
        destinationViewController?.userName = conversationViewController.userName
        destinationViewController?.conversationType = conversationViewController.conversationType
        destinationViewController?.title = conversationViewController.title
        
        self.tabBarController!.tabBar.hidden = true
    }
    
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
        
        // show conversation view
//        
//        conversationViewController.targetId = model.targetId
//        conversationViewController.userName = model.conversationTitle
//        conversationViewController.conversationType = RCConversationType.ConversationType_PRIVATE
//        
//        conversationViewController.title = model.conversationTitle
//        
//        self.navigationController?.pushViewController(conversationViewController, animated: true)
//        self.tabBarController!.tabBar.hidden = true
        
        conversationViewController.targetId = model.targetId
        conversationViewController.userName = model.conversationTitle
        conversationViewController.conversationType = RCConversationType.ConversationType_PRIVATE
        conversationViewController.title = model.conversationTitle
        
        performSegueWithIdentifier("segueToConversationViewController", sender: self)
    }

}
