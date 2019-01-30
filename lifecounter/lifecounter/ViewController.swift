//
//  ViewController.swift
//  lifecounter
//
//  Created by Admin on 1/28/19.
//  Copyright © 2019 Conner Gillette. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var player1Health = 20
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  @IBOutlet weak var player1: UILabel!
  @IBAction func player1Action(_ sender: UIButton, forEvent event: UIEvent) {
    print("click")
    if let text = sender.titleLabel?.text {
      if(text == "+") {
        player1Health += 1
      } else if(text == "-") {
        player1Health -= 1
      } else if(text == "+5") {
        player1Health += 5
      } else if(text == "-5") {
        player1Health -= 5
      }
    }

    player1.text = "Player 1: " + String(player1Health)
  }
  @IBAction func buttonClick(_ sender: Any, forEvent event: UIEvent) {
    print("this works")
  }
}

