//
//  HandViewController.swift
//  PlayingHand
//
//  Created by Thinh Luong on 4/14/16.
//  Copyright © 2016 Thinh Luong. All rights reserved.
//

import UIKit

class HandViewController: UITableViewController {
  
  // MARK: IBActions
  @IBAction func addNewCard(sender: UIBarButtonItem) {
    if hand.numberOfCards < 52 {
      hand = hand.addNewCardAtIndex(0)
      insertTopRow()
    }
  
  }
  
  // MARK: Functions
  private func insertTopRow() {
    tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Fade)
    tableView.reloadData()

  }
  
  private func deleteRowAtIndexPath(indexPath: NSIndexPath) {
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    tableView.reloadData()
  }
  
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem()
  }
  

  // MARK: Properties
  private var hand = Hand.newHand()
  
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension HandViewController {
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return hand.numberOfCards
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCellWithIdentifier("cardCell", forIndexPath: indexPath) as? CardCell else {
      fatalError("Could not create CardCell")
    }
    
    cell.fillWith(hand[indexPath.row])

    return cell
    
  }
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
      hand = hand.deleteCardAtIndex(indexPath.row)
      deleteRowAtIndexPath(indexPath)
    }
  }
  
  override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
    hand = hand.moveCard(sourceIndexPath.row, toIndex:destinationIndexPath.row)
  }

}

















