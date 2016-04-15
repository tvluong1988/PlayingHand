//
//  Hand.swift
//  PlayingHand
//
//  Created by Thinh Luong on 4/14/16.
//  Copyright © 2016 Thinh Luong. All rights reserved.
//

import UIKit

struct Card {

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
}

// MARK: - Card Hashable, Equatable
extension Card: Hashable, Equatable {
  var hashValue: Int {
    return "\(rank.description)\(suit.description)".hashValue
  }
}

func ==(lhs: Card, rhs: Card) -> Bool {
  return lhs.rank == rhs.rank && lhs.suit == rhs.suit
}



struct Deck {
  
  // MARK: Functions
  mutating func nextCard() -> Card? {
    return cards.popFirst()
  }
  
  // MARK: Lifecycle
  init() {
    cards = Set<Card>()
    
    for suit in Card.Suit.allValues {
      for rank in Card.Rank.allValues {
        let card = Card(rank: rank, suit: suit)
        cards.insert(card)
      }
    }
  }
  
  // MARK: Properties
  var cards: Set<Card>

}

class Hand {
  
  // MARK: Functions 
  func cardAtIndex(index: Int) -> Card {
    return cards[index]
  }
  
  func addNewCardAtIndex(index: Int) {
    if let newCard = deck.nextCard() {
      insertCard(newCard, atIndex: index)
    }
  }
  
  func deleteCardAtIndex(index: Int) {
    cards.removeAtIndex(index)
  }
  
  func moveCard(fromIndex: Int, toIndex: Int) {
    let cardToMove = cards[fromIndex]
    deleteCardAtIndex(fromIndex)
    insertCard(cardToMove, atIndex: toIndex)
  }
  
  private func insertCard(card: Card, atIndex index: Int) {
    cards.insert(card, atIndex: index)
  }
  
  // MARK: Properties
  private var deck = Deck()
  private var cards = [Card]()
  
  var numberOfCards: Int {
    return cards.count
  }
}






















