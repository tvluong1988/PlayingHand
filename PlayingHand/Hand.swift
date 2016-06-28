//
//  Hand.swift
//  PlayingHand
//
//  Created by Thinh Luong on 4/14/16.
//  Copyright © 2016 Thinh Luong. All rights reserved.
//

import Foundation

struct Hand {
  
  // MARK: Static Functions
  static func newHand() -> Hand {
    let newDeck = Deck.newDeck()
    let emptyCards = [Card]()
    
    return Hand(deck: newDeck, cards: emptyCards)
  }
  
  // MARK: Functions
  private func insertCard(card: Card, atIndex index: Int) -> Hand {
    
    var mutableCards = cards
    mutableCards.insert(card, atIndex: index)
    
    var mutableDeck = deck
    mutableDeck = mutableDeck.removeCard(card)
    
    return Hand(deck: mutableDeck, cards: mutableCards)
  }
  
  // MARK: Lifecycle
  init() {
    self.deck = Deck.newDeck()
    self.cards = [Card]()
  }
  
  init(deck: Deck, cards: [Card]) {
    self.deck = deck
    self.cards = cards
  }
  
  // MARK: Properties
  private let deck: Deck
  private let cards: [Card]
  
}

// MARK: - DataType
extension Hand: DataType {
  
  var numberOfItems: Int {
    return cards.count
  }
  
  subscript(index: Int) -> Card {
    return cards[index]
  }
  
  func addNewItemAtIndex(index: Int) -> Hand {
    if let card = deck.nextCard() {
      return insertCard(card, atIndex: index)
    }
    
    return self
  }
  
  func deleteItemAtIndex(index: Int) -> Hand {
    
    var mutableCards = cards
    mutableCards.removeAtIndex(index)
    
    return Hand(deck: deck, cards: mutableCards)
  }
  
  func moveItem(fromIndex: Int, toIndex: Int) -> Hand {
    return deleteItemAtIndex(fromIndex).insertCard(cards[fromIndex], atIndex: toIndex)
  }
}





















