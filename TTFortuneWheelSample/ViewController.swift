//
//  ViewController.swift
//  TTFortuneWheelSample
//
//  Created by Efraim Budusan on 10/31/17.
//  Copyright © 2017 Tapptitude. All rights reserved.
//

import UIKit
import TTFortuneWheel

class ViewController: UIViewController {

    var randomSelected = Int()
    var slicesArray = [1,2,3,4,5,6,7,8,9,10,11,12]

    @IBOutlet weak var spinningWheel: TTFortuneWheel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let slices = [ CarnivalWheelSlice.init(title: "5%"),
                       CarnivalWheelSlice.init(title: "30%"),
                       CarnivalWheelSlice.init(title: "5%"),
                       CarnivalWheelSlice.init(title: "DINNER FOR 2"),
                       CarnivalWheelSlice.init(title: "5%"),
                       CarnivalWheelSlice.init(title: "DINNER FOR 2"),
                       CarnivalWheelSlice.init(title: "5%"),
                       CarnivalWheelSlice.init(title: "10%"),
                       CarnivalWheelSlice.init(title: "20%"),
                       CarnivalWheelSlice.init(title: "DINNER FOR 2"),
                       CarnivalWheelSlice.init(title: "5%"),
                       CarnivalWheelSlice.init(title: "10%")]
        spinningWheel.slices = slices
        spinningWheel.equalSlices = true
        spinningWheel.frameStroke.width = 0
        spinningWheel.slices.enumerated().forEach { (pair) in
            let slice = pair.element as! CarnivalWheelSlice
            let offset = pair.offset
            switch offset % 4 {
            case 0: slice.style = .brickRed
            case 1: slice.style = .sandYellow
            case 2: slice.style = .babyBlue
            case 3: slice.style = .deepBlue
            default: slice.style = .brickRed
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rotateButton(_ sender: Any) {

        spinningWheel.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.randomSelected = self.slicesArray.randomItem()!

            self.spinningWheel.startAnimating(fininshIndex: self.randomSelected) { (finished) in
                print(finished)
                print(self.randomSelected)
            }
        }
    }
}

extension Array {
    func randomItem() -> Element? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        print("IN array extention \(index)")
        return self[index]
    }
}
