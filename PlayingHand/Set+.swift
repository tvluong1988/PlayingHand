//
//  Set+.swift
//  PlayingHand
//
//  Created by Thinh Luong on 4/16/16.
//  Copyright © 2016 Thinh Luong. All rights reserved.
//

import GameplayKit

extension Set {
  func randomElement() -> Element? {
    guard self.count != 0 else {
      return nil
    }
    
    let lowestValue = 0
    let highestValue = self.count - 1
    
    let randomDistribution = GKRandomDistribution.init(lowestValue: lowestValue, highestValue: highestValue)
    
    let randomIndex = randomDistribution.nextInt()
    let index = startIndex.advancedBy(randomIndex)
    
    return self[index]
    
  }
}
