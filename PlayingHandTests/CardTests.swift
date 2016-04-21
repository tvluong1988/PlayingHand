//
//  CardTests.swift
//  PlayingHand
//
//  Created by Thinh Luong on 4/21/16.
//  Copyright © 2016 Thinh Luong. All rights reserved.
//

import XCTest
@testable import PlayingHand

class CardTests: XCTestCase {
  // MARK: Tests
  func testDeckNewDeck() {
    let deck = Deck.newDeck()
    XCTAssert(deck.cards.count == Deck.maxNumberOfCards)
  }
  
  func testDeckNextCardUntilEmptyDeck() {
    var deck = Deck.newDeck()
    
    for _ in 1...Deck.maxNumberOfCards {
      if let card = deck.nextCard() {
        deck = deck.removeCard(card)
      }
    }
    
    XCTAssert(deck.cards.count == 0)
    
  }
  
  func testCardInit() {
    var card: Card?
    
    card = Card(rank: .Ace, suit: .Clubs)
    
    XCTAssert(card != nil)
  }
  
  func testCardEquatable() {
    let aceOfSpades = Card(rank: .Ace, suit: .Spades)
    let aceOfSpadesCopy = Card(rank: .Ace, suit: .Spades)
    let kingOfDiamonds = Card(rank: .King, suit: .Diamonds)
    
    XCTAssert(aceOfSpades == aceOfSpadesCopy)
    XCTAssert(aceOfSpades != kingOfDiamonds)
  }
  
  // MARK: Lifecycle
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
}
