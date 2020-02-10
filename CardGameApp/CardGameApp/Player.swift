//
//  Player.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/08.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Player {
    var hand: [Card]
    
    init() {
        hand = [Card]()
    }
    
    func discard() {
        hand = [Card]()
    }
    
    func receive(_ card: Card) {
        hand.append(card)
    }
}
