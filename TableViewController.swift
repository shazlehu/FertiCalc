//
//  TableViewController.swift
//  Snake Oil Calculator
//
//  Created by Samuel Hazlehurst on 2/9/15.
//  Copyright (c) 2015 Terranian Farm. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var calc : CalculatorModel?
    
    @IBOutlet var tView: UITableView!
    
    var items: [String] = ["", "General reccomendations","Nitrogen", "Magnesium"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(animated: Bool) {
        // Get a reference to the model data from the custom tab bar controller.
        calc = (self.tabBarController as! TabBarController).calc
        
        // This tab will simply access the data and display it when the view
        // appears.
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
        let calc = (self.tabBarController as! TabBarController!).calc
        
        //calc.requirementLabel = "Pounds Boron Needed:"
    }
    
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("prepareForSegue")
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }

}
