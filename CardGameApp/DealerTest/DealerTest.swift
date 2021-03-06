//
//  DealerTest.swift
//  DealerTest
//
//  Created by TTOzzi on 2020/02/08.
//  Copyright © 2020 TTOzzi. All rights reserved.
//
@testable import CardGameApp
import XCTest

class DealerTest: XCTestCase {

    var dealer: Dealer!
    
    override func setUp() {
        super.setUp()
        dealer = Dealer()
    }
    
    func testDrawCard() {
        XCTAssertEqual(dealer.deckCount, 52)
        dealer.drawCard()
        XCTAssertEqual(dealer.deckCount, 51)
    }
}
