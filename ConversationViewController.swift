//
//  ConversationViewController.swift
//  WatchaDoin
//
//  Created by Liuqing Du on 15/7/13.
//  Copyright © 2015年 JuneDesign. All rights reserved.
//

import UIKit

class ConversationViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        self.targetId = "tong"
//        self.userName = "tong"
//        
//        self.conversationType = RCConversationType.ConversationType_PRIVATE
//        self.title = self.userName
        
        self.chatSessionInputBarControl.setInputBarType(RCChatSessionInputBarControlType.DefaultType, style: RCChatSessionInputBarControlStyle._CHAT_INPUT_BAR_STYLE_CONTAINER)
        
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
