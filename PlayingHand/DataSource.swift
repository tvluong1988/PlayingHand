//
//  DataSource.swift
//  PlayingHand
//
//  Created by Thinh Luong on 4/16/16.
//  Copyright © 2016 Thinh Luong. All rights reserved.
//

import UIKit

class DataSource: NSObject, SourceType {
  
  // MARK: Functions
  func addItemTo(tableView: UITableView) {
    if dataObject.numberOfItems < 52 {
      dataObject = dataObject.addNewItemAtIndex(0)
      insertTopRowIn(tableView)
    }
  }
  
  // MARK: Properties
  var dataObject: DataType = Hand()

}

extension DataSource: UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataObject.numberOfItems
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCellWithIdentifier("cardCell", forIndexPath: indexPath) as? CardCell,
    hand = dataObject as? Hand else {
      fatalError("Could not create CardCell or Hand instance")
    }
    
    cell.fillWith(hand[indexPath.row])
    
    return cell
    
  }
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
      dataObject = dataObject.deleteItemAtIndex(indexPath.row)
      deleteRowAtIndexPath(indexPath, fromTableView: tableView)
    }
  }
  
  func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
    dataObject = dataObject.moveItem(sourceIndexPath.row, toIndex: destinationIndexPath.row)
  }
}






















