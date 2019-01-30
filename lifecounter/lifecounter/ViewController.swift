//
//  ViewController.swift
//  LifeCounter
//
//  Created by Admin on 1/29/19.
//  Copyright © 2019 Conner Gillette. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var player1Health = 20
  var player2Health = 20
  var player3Health = 20
  var player4Health = 20
  
  @IBOutlet weak var resultText: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    resultText.isHidden = true
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBOutlet weak var player1Label: UILabel!
  @IBOutlet weak var player2Label: UILabel!
  @IBOutlet weak var player3Label: UILabel!
  @IBOutlet weak var player4Label: UILabel!
  
  @IBOutlet var player1Buttons: [UIButton]!
  @IBOutlet var player2Buttons: [UIButton]!
  @IBOutlet var player3Buttons: [UIButton]!
  @IBOutlet var player4Buttons: [UIButton]!
  
  @IBAction func buttonClicked(_ sender: UIButton, forEvent event: UIEvent) {
    print(player2Buttons)
    if (player1Buttons.contains(sender)) {
          print("player 1")
          player1Health = modifyHealth(sender, player1Health)
          player1Label.text = "Player 1: " + String(player1Health)
          if(player1Health <= 0) {
            resultText.text = "Player 1 loses!"
            resultText.isHidden = false;
          }
        } else if (player2Buttons.contains(sender)) {
          print("player 2")
    player2Health = modifyHealth(sender, player2Health)
          player2Label.text = "Player 2: " + String(player2Health)
      if(player2Health <= 0) {
        resultText.text = "Player 2 loses!"
        resultText.isHidden = false;
      }
        } else if (player3Buttons.contains(sender)) {
          print("player 3")
    player3Health = modifyHealth(sender, player3Health)
          player3Label.text = "Player 3: " + String(player3Health)
      if(player3Health <= 0) {
        resultText.text = "Player 3 loses!"
        resultText.isHidden = false;
      }
        } else if(player4Buttons.contains(sender)) {
          print("player 4")
    player4Health = modifyHealth(sender, player4Health)
          player4Label.text = "Player 4: " + String(player4Health)
      if(player4Health <= 0) {
        resultText.text = "Player 4 loses!"
        resultText.isHidden = false;
      }
        }
  }
  
//  func modifyHealth(_ senderTag : Int) {
//    if (senderTag == player1.tag) {
//
//    } else if (senderTag == player2.tag) {
//
//    } else if (senderTag == player3.tag) {
//
//    } else if(senderTag == player4.tag) {
//
//    }
//
//  }
  
  func modifyHealth(_ sender : UIButton, _ playerHealth : Int) -> Int {
    if let text = sender.titleLabel?.text {
      if(text == "+") {
        return (playerHealth + 1)
      } else if(text == "-") {
        return (playerHealth - 1)
      } else if(text == "+5") {
        return (playerHealth + 5)
      } else if(text == "-5") {
        return (playerHealth - 5)
      }
    }
    return playerHealth
  }
  
}

