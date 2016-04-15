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
    if hand.numberOfCards < 5 {
      hand.addNewCardAtIndex(0)
      insertTopRow()
    }
  
  }
  
  // MARK: Functions
  private func insertTopRow() {
    tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Fade)
  }
  
  private func deleteRowAtIndexPath(indexPath: NSIndexPath) {
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
  }
  
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem()
  }
  

  // MARK: Properties
  private let hand = Hand()
  
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
    let cell = tableView.dequeueReusableCellWithIdentifier("cardCell", forIndexPath: indexPath)
    let card = hand.cardAtIndex(indexPath.row)
    
    cell.textLabel?.text = card.rank.description
    cell.textLabel?.textColor = card.color
    cell.detailTextLabel?.text = card.suit.description
    
    return cell
    
  }
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
      hand.deleteCardAtIndex(indexPath.row)
      deleteRowAtIndexPath(indexPath)
    }
  }
  
  override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
    hand.moveCard(sourceIndexPath.row, toIndex:destinationIndexPath.row)
  }

}

















