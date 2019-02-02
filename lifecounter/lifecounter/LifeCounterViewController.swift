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
  
  @IBOutlet weak var collection: UICollectionView!
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Player
    cell.player_number = indexPath.item + 1
    cell.label.text = "Player " + String(cell.player_number) + ": " + String(cell.health)
    return cell
  }
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    collection.delegate = self
    collection.dataSource = self
        // Do any additional setup after loading the view.
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
    switch(sender) {
    case addOne:
      addHealth()
    case subtractOne:
      subtractHealth()
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
