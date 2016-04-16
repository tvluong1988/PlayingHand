//
//  DataType.swift
//  PlayingHand
//
//  Created by Thinh Luong on 4/16/16.
//  Copyright © 2016 Thinh Luong. All rights reserved.
//

import Foundation

protocol DataType {
  // MARK: Properties
  var numberOfItems: Int {get}
  
  // MARK: Functions
  func addNewItemAtIndex(index: Int) -> Self
  func deleteItemAtIndex(index: Int) -> Self
  func moveItem(fromIndex: Int, toIndex: Int) -> Self
}