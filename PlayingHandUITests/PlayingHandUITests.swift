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
    waitForExpectationsWithTimeout(3, handler: nil)
  }
  
  // MARK: Tests
  func testMoveBottomCardToTopPosition() {
    addCardsToHand(maxNumberOfCardsInHand)
    editButton.tap()
    
    let cells = app.tables.cells
    let topCell = cells.elementBoundByIndex(0)
    let bottomCell = cells.elementBoundByIndex(cells.count - 1)
    
    let reorderButton = bottomCell.buttons.elementBoundByIndex(1)
    
    reorderButton.pressForDuration(1, thenDragToElement: topCell)
    
    doneButton.tap()
  }
  
  func testMoveTopCardToBottomPosition() {
    addCardsToHand(maxNumberOfCardsInHand)
    editButton.tap()
    
    let cells = app.tables.cells
    let topCell = cells.elementBoundByIndex(0)
    let bottomCell = cells.elementBoundByIndex(cells.count - 1)

    let reorderButton = topCell.buttons.elementBoundByIndex(1)
    
    reorderButton.pressForDuration(1, thenDragToElement: bottomCell)
  }
  
  func testDeleteMultipleCard() {
    addCardsToHand(maxNumberOfCardsInHand)
    
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
    
    addCardsToHand(maxNumberOfCardsInHand)
    
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
    addCardsToHand(maxNumberOfCardsInHand)
    
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
  lazy var addButton: XCUIElement = {return self.app.navigationBars["Playing Hand"].buttons["Add"]}()
  lazy var editButton: XCUIElement = {return self.app.navigationBars["Playing Hand"].buttons["Edit"]}()
  lazy var doneButton: XCUIElement = {return self.app.navigationBars["Playing Hand"].buttons["Done"]}()
  let maxNumberOfCardsInHand = 5
}
