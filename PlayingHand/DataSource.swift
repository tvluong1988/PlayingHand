//
//  DataSource.swift
//  PlayingHand
//
//  Created by Thinh Luong on 4/16/16.
//  Copyright © 2016 Thinh Luong. All rights reserved.
//

import UIKit

class DataSource: NSObject {
  
  // MARK: Functions
  func addItemTo(tableView: UITableView) {
    if hand.numberOfCards < 52 {
      hand = hand.addNewCardAtIndex(0)
      insertTopRowIn(tableView)
    }
  }
  
  func insertTopRowIn(tableView: UITableView) {
    tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Fade)
    tableView.reloadData()
    
  }
  
  func deleteRowAtIndexPath(indexPath: NSIndexPath, fromTableView tableView: UITableView) {
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    tableView.reloadData()
  }
  
  
  // MARK: Properties
  private var hand = Hand.newHand()
}

extension DataSource: UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return hand.numberOfCards
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCellWithIdentifier("cardCell", forIndexPath: indexPath) as? CardCell else {
      fatalError("Could not create CardCell")
    }
    
    cell.fillWith(hand[indexPath.row])
    
    return cell
    
  }
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
      hand = hand.deleteCardAtIndex(indexPath.row)
      deleteRowAtIndexPath(indexPath, fromTableView: tableView)
    }
  }
  
  func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
    hand = hand.moveCard(sourceIndexPath.row, toIndex:destinationIndexPath.row)
  }
}






















