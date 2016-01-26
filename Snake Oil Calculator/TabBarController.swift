//
//  TabBarController.swift
//  Snake Oil Calculator
//
//  Created by Samuel Hazlehurst on 2/11/15.
//  Copyright (c) 2015 Terranian Farm. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    var calc = CalculatorModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var itemArray = tabBar.items! as [UITabBarItem]
        
        itemArray[0].title = "Calculator"
        itemArray[1].title = "Info"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
