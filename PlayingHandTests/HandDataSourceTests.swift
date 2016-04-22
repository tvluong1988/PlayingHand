//
//  HandDataSourceTests.swift
//  PlayingHand
//
//  Created by Thinh Luong on 4/21/16.
//  Copyright © 2016 Thinh Luong. All rights reserved.
//

import XCTest
@testable import PlayingHand

class HandDataSourceTests: XCTestCase {
  // MARK: Tests
  func testConditionForAddingPass() {
    for _ in 1...(handDataSource.dataObjectMaxNumberOfItems - 1) {
      handDataSource.dataObject.addNewItem()
    }
    
    XCTAssert(handDataSource.conditionForAdding == true)
  }
  
  func testInit() {
    var handDataSource: HandDataSource?
    
    handDataSource = HandDataSource()
    
    XCTAssert(handDataSource != nil)
  }
  
  // MARK: Lifecycle
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: Properties
  var handDataSource = HandDataSource()
}
