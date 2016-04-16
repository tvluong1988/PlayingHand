//
//  CardCell.swift
//  PlayingHand
//
//  Created by Thinh Luong on 4/14/16.
//  Copyright © 2016 Thinh Luong. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {
  // MARK: Functions
  func fillWith(card: Card) {
    textLabel?.text = card.rank.description
    textLabel?.textColor = card.color
    detailTextLabel?.text = card.suit.description
    detailTextLabel?.textColor = card.color
  }
}
