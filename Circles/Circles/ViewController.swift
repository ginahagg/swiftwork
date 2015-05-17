//
//  ViewController.swift
//  Circles
//
//  Created by Gina Hagg on 5/13/15.
//  Copyright (c) 2015 Gina Hagg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct colorcircle {
        var id = 0
        var pt:CGPoint
        var color:UIColor = UIColor.whiteColor()
        var text:String = "hello"
    }
    
    let points = [CGPoint(x: 20, y: 100), CGPoint(x:52, y:23), CGPoint(x:135, y:59), CGPoint(x:0, y:70),
        CGPoint(x:100, y:100), CGPoint(x: 200, y:200), CGPoint(x: 300, y: 150)]
    //rgb(255,174,174) lovely pink
    //rgb(255,236,148) lovely yellow
    //rgb(180,216,231) pale blue
    //rgb(255,240,170) pale yellow
    //rgb(255,98,98)
    //255, 47, 47  red angry
    //174, 174, 255 blues
    //190, 123, 255 spiritual
    
    
    
    let colorcircles = [
        
        colorcircle(id:0,pt:CGPoint(x:52, y:23),color:UIColor(red: 180/255, green: 216/255, blue: 231/255, alpha: 1),text:"so-so"),
        colorcircle(id:1,pt:CGPoint(x:135, y:59), color:UIColor(red: 174/255, green: 174/255, blue: 255/255, alpha: 1),text:"blues"),
        colorcircle(id:2,pt:CGPoint(x:0, y:70), color:UIColor(red: 180/255, green: 216/255, blue: 231/255, alpha: 1),text:"sad"),
        colorcircle(id:3,pt:CGPoint(x:100, y:100), color:UIColor(red: 255/255, green: 236/255, blue: 148/255, alpha: 1),text:"pms"),
        colorcircle(id:4,pt:CGPoint(x: 50, y: 100), color:UIColor(red: 255/255, green: 174/255, blue: 174/255, alpha: 1), text:"love"),
        colorcircle(id:5,pt:CGPoint(x: 120, y: 280), color:UIColor(red: 255/255, green: 98/255, blue: 98/255, alpha: 1), text:"happy"),
        colorcircle(id:6,pt:CGPoint(x: 150, y: 150), color:UIColor(red: 255/255, green: 47/255, blue: 47/255, alpha: 1), text:"angry"),
        colorcircle(id:7,pt:CGPoint(x: 200, y:200), color:UIColor(red: 190/255, green: 123/255, blue: 255/255, alpha: 1), text:"spiritual"),
        colorcircle(id:8,pt:CGPoint(x:450, y:200),color:UIColor.whiteColor(), text:"emptiness"),
        colorcircle(id:9,pt:CGPoint(x:300, y:150),color:UIColor.orangeColor(), text:"joyous")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor()
        drawCircles()
    }

    
    func drawCircles() {
        
        // loop through the points
        for colcircle in colorcircles {
            
            
            // Set a random Circle Radius
            // 2
            var circleWidth = CGFloat(30 + (arc4random() % 50))
            var circleHeight = circleWidth
            
            // Create a new CircleView
            // 3
            var circleView = CircleView(frame: CGRectMake(colcircle.pt.x, colcircle.pt.y, circleWidth, circleHeight), color:colcircle.color, txt:colcircle.text)
            view.addSubview(circleView)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("prepare for segue is called")
    }

}

