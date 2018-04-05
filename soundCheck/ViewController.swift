//
//  ViewController.swift
//  soundCheck
//
//  Created by walter scott on 4/4/18.
//  Copyright © 2018 mk. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
var arr = [1000, 1001, 1002, 1003]
var systemSoundID: SystemSoundID = 1000
var timer:Timer? = nil
var counter = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        set_arr()
        startTimer()
    }
    
    @objc func next_index(){
        var result = 0
        if counter < arr.count {
        result = arr[counter]
            let blah = counter
            self.systemSoundID = UInt32(arr[blah])
            AudioServicesPlaySystemSound (self.systemSoundID)
            print(result)
            counter += 1
            if counter > arr.count{
                stopTimer()
            }
        }
    }
    
    func startTimer() {
        if counter < arr.count{
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(next_index), userInfo: nil, repeats: true)
        } else {
            print("done")
            stopTimer()
        }
}
    
    func stopTimer() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    func set_arr(){
        let arr_to_set = [1004...1019, 1021...1026, 1028...1035,1051...1057, 1070...1075, 1100...1118, 1050...1054, 1200...1211, 1254...1259, 1300...1326, 1328...1335]
        for i in arr_to_set{
            for multiplier in i{
                let multiples = (multiplier)
                print(multiples)
                arr.append(multiples)
            }
        }
        print(arr)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

