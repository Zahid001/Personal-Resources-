//
//  ViewController.swift
//  AllCharts
//
//  Created by Md Zahidul Islam Mazumder on 2/1/20.
//  Copyright © 2020 Md Zahidul Islam Mazumder. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var number1: UISlider!
    
    @IBOutlet weak var number2: UISlider!
    
    @IBOutlet weak var number3: UISlider!
    
    @IBOutlet weak var barChart: BarChartView!
    
    @IBOutlet weak var pieChart: PieChartView!
    
    @IBOutlet weak var lineChart: LineChartView!
    
    var v1 = 0.0
    var v2 = 0.0
    var v3 = 0.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        barChartUpdate()
        pieChartUpdate()
        lineChartUpdate()
        
    }

    @IBAction func renderCharts() {
        barChartUpdate()
        pieChartUpdate()
        lineChartUpdate()
    }
    
    
    @IBAction func value3(_ sender: Any) {
        v3 = Double(number3.value)
        barChartUpdate ()
        pieChartUpdate()
    }
    @IBAction func value1(_ sender: UISlider) {
        v1 = Double(number1.value)
        barChartUpdate ()
        pieChartUpdate()
    }
    
    @IBAction func value2(_ sender: Any) {
        v2 = Double(number2.value)
        barChartUpdate ()
        pieChartUpdate()
    }
    
    
    func lineChartUpdate () {
            
    //        let entry1 = BarChartDataEntry(x: 1.0, y: v1)
    //        let entry2 = BarChartDataEntry(x: 2.0, y: v2)
    //        let entry3 = BarChartDataEntry(x: 3.0, y: v3)
            //let x = barch
        
        //let c1 = ChartDataEntry(x: <#T##Double#>, y: <#T##Double#>)
            //let e1 = LineChartDataSet (entries: <#T##[ChartDataEntry]?#>, label: <#T##String?#>)
            let entry1 = ChartDataEntry(x: 1.0, y: Double(number1.value))
            let entry2 = ChartDataEntry(x: 2.0, y: Double(number2.value))
            let entry3 = ChartDataEntry(x: 3.0, y: Double(number3.value))
            
            
            let dataSet = LineChartDataSet(entries: [entry1,entry2,entry3], label: "Line Chart")
            
            let data = LineChartData(dataSets: [dataSet])
            lineChart.data = data
            lineChart.chartDescription?.text = "Number of Widgets by Type"

            // Color
            dataSet.colors = ChartColorTemplates.vordiplom()

            // Refresh chart with new data
            
            lineChart.notifyDataSetChanged()
            
        }
    
    func barChartUpdate () {
        
//        let entry1 = BarChartDataEntry(x: 1.0, y: v1)
//        let entry2 = BarChartDataEntry(x: 2.0, y: v2)
//        let entry3 = BarChartDataEntry(x: 3.0, y: v3)
        //let x = barch
        
        let entry1 = BarChartDataEntry(x: 1.0, y: Double(number1.value))
        let entry2 = BarChartDataEntry(x: 2.0, y: Double(number2.value))
        let entry3 = BarChartDataEntry(x: 3.0, y: Double(number3.value))
        
        
        let dataSet = BarChartDataSet(entries: [entry1,entry2,entry3], label: "Bar Chart")
        
        let data = BarChartData(dataSets: [dataSet])
        barChart.data = data
        barChart.chartDescription?.text = "Number of Widgets by Type"

        // Color
        dataSet.colors = ChartColorTemplates.vordiplom()

        // Refresh chart with new data
        
        barChart.notifyDataSetChanged()
        
    }
    
    
    func pieChartUpdate () {
        
        let entry1 = PieChartDataEntry(value: Double(number1.value), label: "#1")
        let entry2 = PieChartDataEntry(value: Double(number2.value), label: "#2")
        let entry3 = PieChartDataEntry(value: Double(number3.value), label: "#3")
        
        
        // Basic set up of plan chart
        
//        let entry1 = PieChartDataEntry(value: v1, label: "#1")
//        let entry2 = PieChartDataEntry(value: v2, label: "#2")
//        let entry3 = PieChartDataEntry(value: v3, label: "#3")
        let dataSet = PieChartDataSet(entries: [entry1, entry2, entry3], label: "Widget Types")
        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
        pieChart.chartDescription?.text = "Share of Widgets by Type"

        // Color
        dataSet.colors = ChartColorTemplates.joyful()
        //dataSet.valueColors = [UIColor.black]
        pieChart.backgroundColor = UIColor.black
        pieChart.holeColor = UIColor.clear
        pieChart.chartDescription?.textColor = UIColor.white
        pieChart.legend.textColor = UIColor.white
        
        // Text
        pieChart.legend.font = UIFont(name: "Futura", size: 10)!
        pieChart.chartDescription?.font = UIFont(name: "Futura", size: 12)!
        pieChart.chartDescription?.xOffset = pieChart.frame.width
        pieChart.chartDescription?.yOffset = pieChart.frame.height * (2/3)
        pieChart.chartDescription?.textAlign = NSTextAlignment.left

        // Refresh chart with new data
        pieChart.notifyDataSetChanged()
    }


}

