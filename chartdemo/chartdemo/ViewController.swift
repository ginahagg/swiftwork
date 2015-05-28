//
//  ViewController.swift
//  chartdemo
//
//  Created by Gina Hagg on 5/27/15.
//  Copyright (c) 2015 Gina Hagg. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var _chartView: ScatterChartView!
    
    var options = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Scatter Bar Chart"
        
        
        _chartView.delegate = self;
        
        _chartView.descriptionText = ""
        _chartView.noDataTextDescription = "You need to provide data for the chart."
        
        _chartView.drawGridBackgroundEnabled = false
        _chartView.highlightEnabled = true
        _chartView.dragEnabled = true
        _chartView.setScaleEnabled(true)
        _chartView.maxVisibleValueCount = 200
        _chartView.pinchZoomEnabled = true
        
        var l = _chartView.legend
        l.position = ChartLegend.ChartLegendPosition.RightOfChart
        l.font = UIFont(name: "HelveticaNeue-Light", size: 10.0)!
        
        var yl : ChartYAxis = _chartView.leftAxis
        yl.labelFont = UIFont(name: "HelveticaNeue-Light", size: 10.0)!
        
        _chartView.rightAxis.enabled = false
        
        var xl : ChartXAxis = _chartView.xAxis
        xl.labelFont = UIFont(name: "HelveticaNeue-Light", size: 10.0)!
        xl.drawGridLinesEnabled = false
        setDataCount(20 ,range:10)
    }

    func setDataCount(count : Int , range : UInt32)
    {
    var xVals = [String]()
    
    for  i in 0...count
    {
       xVals.append("\(i)")
    }
    
    var yVals1 = [ChartDataEntry]()
    var yVals2 = [ChartDataEntry]()
    var yVals3 = [ChartDataEntry]()
    
    for  i in 0...count
    {
        var val : Float =  Float(arc4random_uniform(range) + 3)
        yVals1.append(ChartDataEntry(value: val, xIndex: i))
        
        val = Float(arc4random_uniform(range) + 3)
        yVals2.append(ChartDataEntry(value: val, xIndex: i))
        
        val = Float(arc4random_uniform(range) + 3)
        yVals3.append(ChartDataEntry(value: val, xIndex: i))
    }
    
    var set1 : ScatterChartDataSet = ScatterChartDataSet(yVals: yVals1,label: "DS 1")
        println("counts: \(xVals.count), \(yVals1), \(yVals2), \(yVals3)")
    //set1.scatterShape = 3 //ScatterShape.Square
    set1.setColor(ChartColorTemplates.colorful()[0])
    var set2 = ScatterChartDataSet(yVals: yVals2,label: "DS 2")
    //set2.scatterShape = ScatterShape.Circle
    set2.setColor(ChartColorTemplates.colorful()[1])
    var set3 = ScatterChartDataSet(yVals: yVals3,label: "DS 3")
    //set3.scatterShape = ScatterShapeCross;
    set3.setColor(ChartColorTemplates.colorful()[2])
    
    set1.scatterShapeSize = 8
    set2.scatterShapeSize = 8
    set3.scatterShapeSize = 8
    
    var dataSets = [ScatterChartDataSet]()
    dataSets.append(set1)
    dataSets.append(set2)
    dataSets.append(set3)
    
    var data = ScatterChartData(xVals: xVals, dataSets: dataSets)
        
    data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 7.0))
        
    _chartView.data = data
    println("chartview data: \(_chartView.data!.contains(dataSet: set1))")
    }


}

