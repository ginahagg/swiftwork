//
//  AddViewController.swift
//  emptyapp
//
//  Created by Gina Hagg on 7/18/14.
//
//

import UIKit

class AddViewController: UIViewController {

    
    @IBOutlet var TitleTextField: UITextField = UITextField()
    
    @IBOutlet var notesView: UITextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddButtonTabbed(sender: AnyObject) {
        
        var userDefaults = NSUserDefaults.standardUserDefaults()
        var itemList:NSMutableArray? = userDefaults.objectForKey("ItemList") as? NSMutableArray
        var dataset = NSMutableDictionary()
        println(TitleTextField.text)
        println(notesView.text)
        dataset.setObject(TitleTextField.text , forKey: "ItemTitle")
        
        dataset.setObject(notesView.text, forKey: "ItemNote")
        
        if (itemList){
            var newMutableList:NSMutableArray? = NSMutableArray()
            for dict:AnyObject in itemList!{
                newMutableList!.addObject(dict)
            }
            userDefaults.removeObjectForKey("ItemList")
            newMutableList!.addObject(dataset)
            userDefaults.setObject(newMutableList, forKey: "ItemList")
            
        }
        else{
            itemList = NSMutableArray()
            itemList!.addObject(dataset)
            userDefaults.setObject(itemList, forKey: "ItemList")
           
        }
        
        userDefaults.synchronize()
        self.navigationController.popToRootViewControllerAnimated(true)
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
