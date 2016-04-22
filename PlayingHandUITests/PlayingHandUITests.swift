//
//  PlayingHandUITests.swift
//  PlayingHandUITests
//
//  Created by Thinh Luong on 4/14/16.
//  Copyright © 2016 Thinh Luong. All rights reserved.
//

import XCTest

class PlayingHandUITests: XCTestCase {
  
  // MARK: Helpers
  func addCardsToHand(count: Int) {
    for _ in 1...count {
      addButton.tap()
    }
    
    let cells = app.tables.cells
    
    let predicate = NSPredicate(format: "count == \(count)")
    
    expectationForPredicate(predicate, evaluatedWithObject: cells, handler: nil)
    waitForExpectationsWithTimeout(5, handler: nil)
  }
  
  // MARK: Tests
  func testMoveTopCardToBottomPosition() {
    addCardsToHand(5)
    editButton.tap()
    
    let cells = app.tables.cells
    let topCell = cells.elementBoundByIndex(0)
    let bottomCell = cells.elementBoundByIndex(cells.count - 1)

    let reorderButton = topCell.buttons.elementBoundByIndex(1)
    
//    print("TopCell before move: \(topCell.debugDescription)")
    
    reorderButton.pressForDuration(1, thenDragToElement: bottomCell)
    
//    print("TopCell after move: \(topCell.debugDescription)")

  }
  
  func testDeleteMultipleCard() {
    addCardsToHand(5)
    
    let cells = app.tables.cells
    
    editButton.tap()
    
    for _ in 1...5 {
      let cell = cells.elementBoundByIndex(0)
      
      let deleteCellButton = cell.buttons.elementBoundByIndex(0)
      let deleteButton = app.buttons["Delete"]
      
      deleteCellButton.tap()
      deleteButton.tap()
    }
    
    doneButton.tap()
    
    XCTAssert(cells.count == 0, "\(cells.debugDescription)")
  }
  
  func testDeleteSingleCard() {
    
    addCardsToHand(1)
    
    let cells = app.tables.cells
    
    editButton.tap()
    
    let cell = cells.elementBoundByIndex(0)
    
    let deleteCellButton = cell.buttons.elementBoundByIndex(0)
    let deleteButton = app.buttons["Delete"]
    
    deleteCellButton.tap()
    deleteButton.tap()
    
    doneButton.tap()
    
    XCTAssert(cells.count == 0, "\(cells.debugDescription)")
  }
  
  func testEditButtonTapAddButtonMultipleTaps() {
    editButton.tap()
    
    addCardsToHand(5)
    
    let cells = app.tables.cells
    
    doneButton.tap()
    
    XCTAssert(cells.count == 5, "\(cells.debugDescription)")
  }
  
  func testEditButtonTapAddButtonSingleTap() {
    editButton.tap()
    
    addCardsToHand(1)
    
    let cells = app.tables.cells
    
    doneButton.tap()
    
    XCTAssert(cells.count == 1, "\(cells.debugDescription)")
  }
  
  func testAddButtonMultipleTaps() {
    addCardsToHand(5)
    
    let cells = app.tables.cells
    
    XCTAssert(cells.count == 5, "\(cells.debugDescription)")
    
  }
  
  func testAddButtonSingleTap() {
    
    addCardsToHand(1)
    
    let cells = app.tables.cells
    
    XCTAssert(cells.count == 1, "\(cells.debugDescription)")
    
  }
  
  func testTitleLabelExists() {
    let titleLabel = app.navigationBars["Playing Hand"].staticTexts["Playing Hand"]
    
    XCTAssert(titleLabel.exists)
  }
  
  func testEditButtonExists() {
    
    XCTAssert(editButton.exists)
  }
  
  func testAddButtonExists() {
    
    XCTAssert(addButton.exists)
  }
  
  
  // MARK: Lifecycle
  override func setUp() {
    super.setUp()
    
    continueAfterFailure = false
    app.launch()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: Properties
  let app = XCUIApplication()
  lazy var addButton: XCUIElement = self.app.navigationBars["Playing Hand"].buttons["Add"]
  lazy var editButton: XCUIElement = self.app.navigationBars["Playing Hand"].buttons["Edit"]
  lazy var doneButton: XCUIElement = self.app.navigationBars["Playing Hand"].buttons["Done"]
  
}
