//
//  Dealer.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/08.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Dealer: Player {
    var deck = Deck()
    var drawnCard: Card?
    
    func drawCard() {
        drawnCard = deck.removeOne()
    }
}