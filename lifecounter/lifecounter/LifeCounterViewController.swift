//
//  LifeCounterViewController.swift
//  LifeCounter
//
//  Created by Admin on 2/2/19.
//  Copyright © 2019 Conner Gillette. All rights reserved.
//

import UIKit

class LifeCounterViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
  var num_players = 2
  var players : [Player] = []
  var history : [String] = []
  
  @IBOutlet weak var collection: UICollectionView!
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return num_players
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Player
    cell.player_number = indexPath.item + 1
    cell.label.text = "Player " + String(cell.player_number) + ": " + String(cell.health)
//    players.append(cell)
//    print(players)
    return cell
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collection.delegate = self
    collection.dataSource = self
    // Do any additional setup after loading the view.
  }
  
  @IBAction func addPlayer(_ sender: Any) {
    self.num_players += 1
    collection.reloadData()
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}

class Player: UICollectionViewCell {
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var addOne: UIButton!
  @IBOutlet weak var subtractOne: UIButton!
  @IBOutlet weak var addX: UIButton!
  @IBOutlet weak var subtractX: UIButton!
  
  var health : Int = 20
  var player_number : Int = 0
  
  @IBAction func buttonPressed(_ sender: UIButton, forEvent event: UIEvent) {
    print("button pressed " + String(player_number));
    switch(sender) {
    case addOne:
      addOneHealth()
    case subtractOne:
      subtractOneHealth()
    default:
      break;
    }
  }
  
  func setLabel() {
    self.label.text = "Player \(player_number): \(health)"
  }
  
  func addOneHealth() {
    self.health += 1
    setLabel()
  }
  
  func addHealth() {
    
  }
  
  func subtractOneHealth() {
    self.health -= 1
    setLabel()
  }
  
  func subtractHealth() {
    
  }
}
