//
//  HandDataSource.swift
//  PlayingHand
//
//  Created by Thinh Luong on 4/16/16.
//  Copyright © 2016 Thinh Luong. All rights reserved.
//

import UIKit

class HandDataSource: DataSource {
  
  // MARK: Functions
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCellWithIdentifier("cardCell", forIndexPath: indexPath) as? CardCell,
      hand = dataObject as? Hand else {
        return UITableViewCell()
    }
    
    cell.fillWith(hand[indexPath.row])
    
    return cell
  }
  
  // MARK: Lifecycle
  init() {
    super.init(dataObject: Hand())
  }
  
  // MARK: Properties
  override var conditionForAdding: Bool {
    return dataObject.numberOfItems < dataObjectMaxNumberOfItems
  }
  
  let dataObjectMaxNumberOfItems = 5
}














