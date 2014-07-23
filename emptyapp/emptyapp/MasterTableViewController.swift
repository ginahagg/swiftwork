//
//  MasterTableViewController.swift
//  emptyapp
//
//  Created by Gina Hagg on 7/18/14.
//
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    var todoItems : NSMutableArray = NSMutableArray()

    override func viewDidAppear(animated: Bool) {
        var userDefaults = NSUserDefaults.standardUserDefaults()
        var itemListFromUserDefaults:NSMutableArray? = userDefaults.objectForKey("ItemList") as? NSMutableArray
        
        if (itemListFromUserDefaults){
            todoItems = itemListFromUserDefaults!
        }
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
       
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        
        return todoItems.count
    }

    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        var todo:NSDictionary = todoItems.objectAtIndex(indexPath!.row) as NSDictionary
        cell.textLabel.text = todo.objectForKey("ItemTitle") as NSString

        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue){
            if(segue.identifier == "showDetail"){
                var indexPath = self.tableView.indexPathForSelectedRow()
                var detailViewController = segue.destinationViewController as DetailViewController
                detailViewController.todoData = self.todoItems.objectAtIndex(indexPath.row) as NSDictionary
            
                
            }
            else{}
        }
    }
    

}
