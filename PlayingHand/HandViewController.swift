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
    dataSource.addItemTo(tableView)
  }
  
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = dataSource
    navigationItem.leftBarButtonItem = editButtonItem()
    
    title = "Playing Hand"
  }
  
  
  // MARK: Properties
  private var dataSource = HandDataSource()
}

















