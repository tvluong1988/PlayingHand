//
//  SourceType.swift
//  PlayingHand
//
//  Created by Thinh Luong on 4/16/16.
//  Copyright © 2016 Thinh Luong. All rights reserved.
//

import UIKit

protocol SourceType: UITableViewDataSource {
  var dataObject: DataType {get set}
  
  func insertTopRowIn(tableView: UITableView)
  func deleteRowAtIndexPath(indexPath: NSIndexPath, fromTableView tableView: UITableView)
}

extension SourceType {
  
  func insertTopRowIn(tableView: UITableView) {
    tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Fade)
    tableView.reloadData()
    
  }
  
  func deleteRowAtIndexPath(indexPath: NSIndexPath, fromTableView tableView: UITableView) {
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    tableView.reloadData()
  }
}






















