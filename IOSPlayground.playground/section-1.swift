// Playground - noun: a place where people can play

import UIKit

class DataSource: NSObject, UITableViewDataSource {
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        
        let idx = indexPath.row
        
        let style = UITableViewCellStyle.fromRaw(idx)
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        
        cell.textLabel.text = "gina-cell-text"
        
        
        let path = NSBundle.pathForResource("flag-red", ofType:"png", inDirectory: "/Users/ginahagg/work/gina-prototypes")
        
        let img = UIImage(named: path)
        cell.imageView.image = img
        
        if let detailTextLabel = cell.detailTextLabel{
            detailTextLabel.text = "gina-detail-text"
        }
        return cell
    }

}

let ds = DataSource()

let tableView = UITableView(frame: CGRect(x:0, y:0, width: 380, height:240), style: .Plain)

tableView.dataSource = ds
tableView.reloadData()
