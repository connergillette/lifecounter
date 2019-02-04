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
  var game_started = false
  var players : [Player] = []
  var history : [String] = []
  
  @IBOutlet var collection: UICollectionView!
  
  @IBOutlet var addPlayerButton: UIButton!
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch(segue.identifier) {
    case "History":
      let source = segue.source as! LifeCounterViewController
      let destination = segue.destination as! LifeCounterHistory
      destination.incomingHistory = self.history
    default:
      NSLog("Unkown segue identifier: \(segue.identifier!)")
    }
  }
  
  @IBAction func buttonPressed(_ sender: UIButton) {
    if(addPlayerButton.isEnabled && !self.game_started) {
      addPlayerButton.isEnabled = false
      self.game_started = true
    }
    
    for player in self.players {
      if(sender == player.addOne) {
        history.append("Player \(player.player_number) gained 1 health.");
      } else if(sender == player.subtractOne) {
        history.insert("Player \(player.player_number) lost 1 health.", at: 0)
      } else if(sender == player.addX) {
        history.insert("Player \(player.player_number) gained \(player.custom_value) health.", at: 0)
      } else if(sender == player.subtractX) {
        history.insert("Player \(player.player_number) lost \(player.custom_value) health.", at: 0)
      }
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return num_players
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Player
    cell.player_number = indexPath.item + 1
    cell.label.text = "Player " + String(cell.player_number) + ": " + String(cell.health)
    players.append(cell)
//    print(players)
    return cell
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collection.delegate = self
    collection.dataSource = self
    // Do any additional setup after loading the view.
    
    print("view did load")
  }
  
  @IBAction func addPlayer(_ sender: Any) {
    if(self.num_players < 8 && !self.game_started) {
      self.num_players += 1
      collection.reloadData()
    }
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

class LifeCounterHistory: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var table: UITableView!
  var history : [String] = []
  var incomingHistory : [String]! = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.history = incomingHistory
    table.delegate = self
    table.dataSource = self
    print("history: \(self.history)")
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.history.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! HistoryItem
    cell.labelText = history[indexPath.item]
    cell.label.text = cell.labelText
    cell.item_number = indexPath.item
    return cell
  }
}

class Player: UICollectionViewCell {
  @IBOutlet var label: UILabel!
  @IBOutlet var addOne: UIButton!
  @IBOutlet var subtractOne: UIButton!
  @IBOutlet var addX: UIButton!
  @IBOutlet var subtractX: UIButton!
  
  @IBOutlet weak var numberField: UITextField!
  
  var health : Int = 20
  var player_number : Int = 0
  var custom_value : Int = 5

  @IBAction func buttonPressed(_ sender: UIButton, forEvent event: UIEvent) {
    switch(sender) {
    case addOne:
      addOneHealth()
      break
    case subtractOne:
      subtractOneHealth()
      break
    case addX:
      addHealth()
      break
    case subtractX:
      subtractHealth()
      break
    default:
      break;
    }
  }
  
  func setLabel() {
    self.label.text = "Player \(self.player_number): \(self.health)"
  }
  
  @IBAction func numberChanged(_ sender: UITextField) {
    print("number changed")
    if sender.text != nil {
      addX.setTitle("+" + sender.text!, for: .normal)
      subtractX.setTitle("-" + sender.text!, for: .normal)
      
      self.custom_value = Int(sender.text!)!
    }
  }
  @IBAction func editingDidEnd(_ sender: UITextField) {
   
    print("editing did end")
    if sender.text != nil {
       self.numberField.resignFirstResponder()
      addX.setTitle("+" + sender.text!, for: .normal)
      subtractX.setTitle("-" + sender.text!, for: .normal)
      
      self.custom_value = Int(sender.text!)!
    }
  }
  
  func addOneHealth() {
    self.health += 1
    setLabel()
  }
  
  func addHealth() {
    self.health += self.custom_value
    setLabel()
  }
  
  func subtractOneHealth() {
    self.health -= 1
    setLabel()
  }
  
  func subtractHealth() {
    self.health -= self.custom_value
    setLabel()
  }
}

class HistoryItem: UITableViewCell {
  @IBOutlet weak var label: UILabel!
  var item_number : Int = 0
  var labelText : String = ""
}
