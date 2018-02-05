//
//  ViewController.swift
//  Tipster
//
//  Created by Dojo on 1/11/18.
//  Copyright © 2018 Dojo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billLabel: UILabel!
    
    @IBOutlet weak var taxLable1: UILabel!
    @IBOutlet weak var taxLable2: UILabel!
    @IBOutlet weak var taxLable3: UILabel!
    
    @IBOutlet weak var tipValue1: UILabel!
    @IBOutlet weak var tipValue2: UILabel!
    @IBOutlet weak var tipValue3: UILabel!
    
    @IBOutlet weak var totalVal1: UILabel!
    @IBOutlet weak var totalVal2: UILabel!
    @IBOutlet weak var totalVal3: UILabel!
    
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var groupSlider: UISlider!
    
    @IBOutlet weak var groupSizeLabel: UILabel!
    var minTip = 0
    var avgTip = 0
    var maxTip = 0
    var decimalCounter = 0
    var groupsize = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billLabel.text = "0"
        groupsize = 1
        decimalCounter = 0
        
        self.taxLable1.text = "5 %"
        self.taxLable2.text = "10 %"
        self.taxLable3.text = "15 %"
        
        self.tipValue1.text = "0.00"
        self.tipValue2.text = "0.00"
        self.tipValue3.text = "0.00"
        
        self.totalVal1.text = "0.00"
        self.totalVal2.text = "0.00"
        self.totalVal3.text = "0.00"
        
        tipSlider.value = 0
        tipSlider.minimumValue = 0.05
        tipSlider.maximumValue = 0.5
        
        groupSizeLabel.text = "Group Size \(groupsize)"
        groupSlider.value = 1
        groupSlider.minimumValue = 1
        groupSlider.maximumValue = 20
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addTip(_ sender: UISlider) {
        minTip = Int(sender.value * 100)
        avgTip = minTip+5
        maxTip = minTip+10
        updateLabels()
    }
    
    @IBAction func setGroupSize(_ sender: UISlider) {
        groupsize = Int(sender.value)
        updateLabels()
    }
    
    func getTipValue(_ tip: Int) -> Double{
        var tips = Double(billLabel.text!)
        tips! = (tips! * Double(tip))/100
        return tips!
    }
    func updateLabels(){
        taxLable1.text = String(minTip)+" %"
        taxLable2.text = String(avgTip)+" %"
        taxLable3.text = String(maxTip)+" %"
        
        tipValue1.text = String((self.getTipValue(minTip))/Double(groupsize))
        tipValue2.text = String((self.getTipValue(avgTip))/Double(groupsize))
        tipValue3.text = String((self.getTipValue(maxTip))/Double(groupsize))
        
        totalVal1.text = String((Double(billLabel.text!)! + Double(tipValue1.text!)!)/Double(groupsize))
        totalVal2.text = String((Double(billLabel.text!)! + Double(tipValue2.text!)!)/Double(groupsize))
        totalVal3.text = String((Double(billLabel.text!)! + Double(tipValue3.text!)!)/Double(groupsize))
        
        groupSizeLabel.text = "Group Size  \(groupsize)"
    }
    
   
    @IBAction func calcButtons(_ sender: UIButton) {
        if billLabel.text == "0"{
            billLabel.text = ""
            billLabel.text = billLabel.text! + sender.currentTitle!
        }else{
            billLabel.text = billLabel.text! + sender.currentTitle!
        }
        
        updateLabels()
    }
    @IBAction func clearButton(_ sender: UIButton) {
        billLabel.text = "0"
        self.viewDidLoad()
    }
    
    @IBAction func dotClicked(_ sender: UIButton) {
        if(decimalCounter == 0){
            billLabel.text = billLabel.text! + sender.currentTitle!
            decimalCounter += 1
        }
    }
}

