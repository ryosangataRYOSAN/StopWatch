//
//  ViewController.swift
//  StopWatch
//
//  Created by ryohei suzuki on 2018/09/17.
//  Copyright © 2018年 ryohei suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label : UILabel!
    @IBOutlet var hanteiLabel :UILabel!
    
    var count : Float = 0.0
    
    var timer : Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @objc func up(){
        print("呼び出し")
        count = count + 0.01
        label.text = String(format : "%.2f",count)
    }
    
    
    @IBAction func start(){
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target : self,
                                         selector : #selector(self.up),
                                         userInfo : nil,
                                         repeats : true
            )
        }
    }
    
    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
            hantei()
        }
    }
    
    @IBAction func reset(){
        if timer.isValid{
            stop()
        }
        count = 0
        label.text = "0"
        hanteiLabel.text = ""
    }
    
    func hantei(){
        if fabs(count-10.0) < 0.2{
            hanteiLabel.text = "PERFECT!"
            hanteiLabel.textColor = UIColor.red
        }else if fabs(count-10.0) < 0.3{
            hanteiLabel.text = "GREAT!"
            hanteiLabel.textColor = UIColor.orange
        }else if fabs(count-10.0) < 0.5{
            hanteiLabel.text = "GOOD!"
            hanteiLabel.textColor = UIColor.blue
        }else{
            hanteiLabel.text = "BAD"
            hanteiLabel.textColor = UIColor.black
        }
    }
    
    
}

