//
//  DetailViewController.swift
//  emptyapp
//
//  Created by Gina Hagg on 7/18/14.
//
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var nView: UITextView = UITextView()
    @IBOutlet var titleField: UITextField = UITextField()
    
    
    var todoData = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Detail View Loaded")
        titleField.userInteractionEnabled = false
        nView.userInteractionEnabled = false
        
        titleField.text = todoData.objectForKey("ItemTitle") as String
        nView.text = todoData.objectForKey("ItemNote") as String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func deleteItem(sender: AnyObject) {
        var userDefaults = NSUserDefaults.standardUserDefaults()
        var itemListArray = userDefaults.objectForKey("ItemList") as NSMutableArray
        var tempArray :NSMutableArray = NSMutableArray()
        
        for dict in itemListArray{
            tempArray.addObject(dict as NSDictionary)
        }
        tempArray.removeObject(todoData)
        userDefaults.removeObjectForKey("ItemList")
        userDefaults.setObject(tempArray, forKey: "ItemList")
        userDefaults.synchronize()
        navigationController.popToRootViewControllerAnimated(true)
    }
    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
