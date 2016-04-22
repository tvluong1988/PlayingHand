//
//  HandTests.swift
//  PlayingHand
//
//  Created by Thinh Luong on 4/21/16.
//  Copyright © 2016 Thinh Luong. All rights reserved.
//

import XCTest
import GameplayKit
@testable import PlayingHand

class HandTests: XCTestCase {
  
  // MARK: Tests
  func testMoveItem() {
    for _ in 1...Deck.maxNumberOfCards {
      hand = hand.addNewItem()
    }
    
    let lowestValue = 0
    let highestValue = hand.numberOfItems - 1
    
    let gkRandomShuffle = GKShuffledDistribution.init(lowestValue: lowestValue, highestValue: highestValue)
    
    for _ in 1...100 {
      let fromIndex = gkRandomShuffle.nextInt()
      let toIndex = gkRandomShuffle.nextInt()
      
      let cardAtFromIndex = hand[fromIndex]
      
      hand = hand.moveItem(fromIndex, toIndex: toIndex)
      
      let cardAtToIndex = hand[toIndex]
      
      XCTAssert(cardAtFromIndex == cardAtToIndex)
    }
    
  }
  
  func testDeleteItemAtIndexMultipleTimes() {
    for _ in 1...Deck.maxNumberOfCards {
      hand = hand.addNewItem()
    }
    
    for _ in 1...Deck.maxNumberOfCards {
      hand = hand.deleteItemAtIndex(0)
      XCTAssert(hand.numberOfItems >= 0 && hand.numberOfItems < Deck.maxNumberOfCards)
    }
  }
  
  func testAddNewItemMultipleTimes() {
    for _ in 1...(Deck.maxNumberOfCards + 10) {
      hand = hand.addNewItem()
      XCTAssert(hand.numberOfItems <= Deck.maxNumberOfCards)
    }
  }
  
  func testNewHand() {
    var hand: Hand?
    
    hand = Hand.newHand()
    
    XCTAssert(hand != nil)
    XCTAssert(hand?.numberOfItems == 0)
  }
  
  func testInit() {
    var hand: Hand?
    
    hand = Hand()
    
    XCTAssert(hand != nil)
    XCTAssert(hand?.numberOfItems == 0)
  }
  
  // MARK: Lifecycle
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: Properties
  var hand = Hand()
  
}
