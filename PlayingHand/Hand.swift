//
//  Hand.swift
//  PlayingHand
//
//  Created by Thinh Luong on 4/14/16.
//  Copyright © 2016 Thinh Luong. All rights reserved.
//

import UIKit

struct Card: Hashable, Equatable {
  
  // MARK: Enums
  enum Suit: String, CustomStringConvertible {
    case Spades, Hearts, Diamonds, Clubs
    
    static let allValues = [Spades, Hearts, Diamonds, Clubs]
    
    var description: String {
      return self.rawValue
    }
    
  }
  
  enum Rank: String, CustomStringConvertible {
    case Two,Three,Four,Five
    case Six,Seven,Eight,Nine,Ten
    case Jack,Queen,King,Ace
    
    static let allValues = [Two, Three, Four, Five,
                            Six, Seven, Eight, Nine, Ten,
                            Jack, Queen, King, Ace]
    
    var description: String {
      return self.rawValue
    }
  }
  
  
  // MARK: Properties
  let rank: Rank
  let suit: Suit
  
  var color: UIColor {
    switch self.suit {
    case .Spades, .Clubs:
      return UIColor.blackColor()
    case .Diamonds, .Hearts:
      return UIColor.redColor()
    }
  }
  
  var hashValue: Int {
    return "\(rank.description)\(suit.description)".hashValue
  }
}

func ==(lhs: Card, rhs: Card) -> Bool {
  return lhs.rank == rhs.rank && lhs.suit == rhs.suit
}



struct Deck {
  
  // MARK: Functions
  static func newDeck() -> Deck {
    var allCards = Set<Card>()
    
    for suit in Card.Suit.allValues {
      for rank in Card.Rank.allValues {
        let card = Card(rank: rank, suit: suit)
        allCards.insert(card)
      }
    }
    
    return Deck(cards: allCards)
  }
  
  func nextCard() -> Card? {
    return cards.randomElement()
  }
  
  func removeCard(card: Card) -> Deck {
    if cards.contains(card) {
      var mutableCards = cards
      mutableCards.remove(card)
      
      return Deck(cards: mutableCards)
    }
    
    return self
  }
  
  // MARK: Properties
  let cards: Set<Card>
  
}

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
    mutableCards.append(card)
    
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
  
  subscript(index: Int) -> Card {
    return cards[index]
  }
  
}

extension Hand: DataType {
  
  var numberOfItems: Int {
    return cards.count
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





















