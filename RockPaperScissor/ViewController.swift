//
//  ViewController.swift
//  RockPaperScissor
//
//  Created by kevin on 2018/4/20.
//  Copyright © 2018年 KevinChang. All rights reserved.
//

import UIKit
import GameplayKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl! //玩家選擇
    @IBOutlet weak var computerChoise: UILabel! //電腦出拳顯示位置
    @IBOutlet weak var result: UILabel! //結果顯示位置
    @IBOutlet weak var playButton: UIButton!
    let fists = ["👊", "🖐", "✌️"] //隨機拳種陣列
    var computer = "" //預留空字串讓電腦出拳
    let results = ["You win!", "You lost!","Draw!"] //結果陣列
    
    @IBOutlet weak var playerScore: UILabel! //玩家分數
    var playerScoreNumber = 0 //玩家分數數字
    @IBOutlet weak var computerScore: UILabel! //電腦分數
    var computerScoreNumber = 0 //電腦分數數字
    
    
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
                computerScoreNumber += 1
            }else if computer == fists[2]{
                result.text = results[0]
                playerScoreNumber += 1
            }
        case _ where self.segmentedControl.selectedSegmentIndex == 1:
            if computer == fists[0]{
                result.text = results[0]
                playerScoreNumber += 1
            }else if computer == fists[1]{
                result.text = results[2]
            }else if computer == fists[2]{
                result.text = results[1]
                computerScoreNumber += 1
            }
        case _ where self.segmentedControl.selectedSegmentIndex == 2:
            if computer == fists[0]{
                result.text = results[1]
                computerScoreNumber += 1
            }else if computer == fists[1]{
                result.text = results[0]
                playerScoreNumber += 1
            }else if computer == fists[2]{
                result.text = results[2]
            }
        default:
            print("error")
        }
        playerScore.text = "\(playerScoreNumber)"
        computerScore.text = "\(computerScoreNumber)"
        
        let speechUtterence = AVSpeechUtterance(string: result.text!)
        let synth = AVSpeechSynthesizer()
        synth.speak(speechUtterence)
        
    }
    
    @IBAction func resetButtonPress(_sender: Any ){
        playerScoreNumber = 0
        computerScoreNumber = 0
        playerScore.text = "0"
        computerScore.text = "0"
        result.isHidden = true
        computerChoise.isHidden = true
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

