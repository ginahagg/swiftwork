//
//  ViewController.swift
//  StretchHeaders
//
//  Created by Gina Hagg on 5/4/15.
//  Copyright (c) 2015 Gina Hagg. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UIScrollViewDelegate {
    
    private let kTableHeaderHeight: CGFloat = 300.0
    var headerView: UIView!
    
    let items = [
        NewsItem(category:.World,summary:"Climate Change protests, divestments meet fossil fuels realities."),
        NewsItem(category:.Europe,summary:"Scotland's 'YES' leader says, independence vote is 'Once in a lifetime'."),
        NewsItem(category:.MiddleEast,summary:"Airstrikes boost Islamic state, FBI Director warns more hostages possible."),
        NewsItem(category:.Africa,summary:"Nigeria says 70 dead in building collapse; questions S. Africa victim claim."),
        NewsItem(category:.AsiaPacific,summary:"Despite UN Ruling, Japan seeks backing for whale hunting."),
        NewsItem(category:.Americas,summary:"Officials FBI is tracking 100 Americans who fought alonside of ISIS in Syria."),
    NewsItem(category:.World,summary:"South Africa in 40 bilion deal for Russian nuclear reactors."),
    NewsItem(category:.Europe,summary:"One million babies created by EU student exhanges.")]

    override func viewDidLoad() {
        super.viewDidLoad()
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        updateHeaderView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -kTableHeaderHeight{
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NewsItemCell
        cell.newsItem = item
        return cell
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }

}

