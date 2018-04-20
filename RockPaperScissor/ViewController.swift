//
//  ViewController.swift
//  RockPaperScissor
//
//  Created by kevin on 2018/4/20.
//  Copyright © 2018年 KevinChang. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var computerChoise: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var playButton: UIButton!
    let fists = ["👊", "🖐", "✌️"]
    var computer = ""
    let results = ["You won!", "You lost!","Draw!"]
    
    
    
    @IBAction func playButtonPress(_sender: Any){
        computer = fists[GKRandomDistribution(lowestValue: 0, highestValue: 2).nextInt()]
        computerChoise.text = computer
        computerChoise.isHidden = false
        result.isHidden = false
        
        switch segmentedControl{
        case _ where self.segmentedControl.selectedSegmentIndex == 0:
            if computer == fists[0]{
                result.text = results[2]
            }else if computer == fists[1]{
                result.text = results[1]
            }else if computer == fists[2]{
                result.text = results[0]
            }
        case _ where self.segmentedControl.selectedSegmentIndex == 1:
            if computer == fists[0]{
                result.text = results[0]
            }else if computer == fists[1]{
                result.text = results[2]
            }else if computer == fists[2]{
                result.text = results[1]
            }
        case _ where self.segmentedControl.selectedSegmentIndex == 2:
            if computer == fists[0]{
                result.text = results[1]
            }else if computer == fists[1]{
                result.text = results[0]
            }else if computer == fists[2]{
                result.text = results[2]
            }
        default:
            print("error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

