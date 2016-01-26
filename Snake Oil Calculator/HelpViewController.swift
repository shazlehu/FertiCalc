//
//  HelpViewController.swift
//  Snake Oil Calculator
//
//  Created by Samuel Hazlehurst on 3/25/15.
//  Copyright (c) 2015 Terranian Farm. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.paginationMode = UIWebPaginationMode.Unpaginated

        if let helpFile = NSBundle.mainBundle().pathForResource("help", ofType: "htm"){
            let targetURL = NSURL(fileURLWithPath: helpFile)
            
            let request = NSURLRequest(URL: targetURL)
            webView.loadRequest(request)
            
        }
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
