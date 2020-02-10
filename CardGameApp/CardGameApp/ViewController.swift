//
//  ViewController.swift
//  CardGameApp
//
//  Created by TTOzzi on 2020/02/05.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pokerGame = PokerGame(gameType: .sevenCardStud, numberOfPlayers: 4)
    
    var playerStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
//        stack.spacing = 30
        return stack
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))
        
        let control = UISegmentedControl(items: ["7 Cards", "5 Cards"])
        let control2 = UISegmentedControl(items: ["2명", "3명", "4명"])

        control.selectedSegmentIndex = 0
        control2.selectedSegmentIndex = 1
        control.translatesAutoresizingMaskIntoConstraints = false
        control2.translatesAutoresizingMaskIntoConstraints = false
        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        control.backgroundColor = .clear
        control.tintColor = .clear
        control.layer.borderWidth = 1
        control.layer.borderColor = UIColor.white.cgColor
        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))], for: .selected)
        control2.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        control2.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(patternImage: #imageLiteral(resourceName: "bg_pattern"))], for: .selected)
        control2.layer.borderWidth = 1
        control2.layer.borderColor = UIColor.white.cgColor


        
        self.view.addSubview(control)
        self.view.addSubview(control2)
        
        control.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        control.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 120).isActive = true
        control.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -120).isActive = true
        control2.topAnchor.constraint(equalTo: control.bottomAnchor, constant: 10).isActive = true
        control2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 120).isActive = true
        control2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -120).isActive = true
        pokerGame.addPlayers()
        pokerGame.play()
        var index = 1
        pokerGame.players.forEach {
            let stack: UIStackView = {
                let stack = UIStackView()
                stack.translatesAutoresizingMaskIntoConstraints = false
                stack.distribution = .fillEqually
                stack.axis = .vertical
                stack.spacing = -20
                return stack
            }()
            let label = UILabel()
            if index < pokerGame.players.count {
                label.text = "Player\(index)"
            } else {
                label.text = "Dealer"
            }
            index += 1
            label.textColor = .white
            stack.addArrangedSubview(label)
            stack.addArrangedSubview(makeCardStack(hand: $0.hand))
            playerStack.addArrangedSubview(stack)
        }
        
        self.view.addSubview(playerStack)
        playerStack.topAnchor.constraint(equalTo: control2.topAnchor, constant: 30).isActive = true
        playerStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        playerStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
    }
    
    func makeCards(cardStack: UIStackView, cards: [Card]) {
        cards.forEach {
            let card = UIImageView(image: #imageLiteral(resourceName:"\($0).png") )
            card.heightAnchor.constraint(equalTo: card.widthAnchor, multiplier: 1.27).isActive = true
            cardStack.addArrangedSubview(card)
        }
    }
    
    func makeCardStack(hand: [Card]) -> UIStackView {
        let cardStack: UIStackView = {
            let stack = UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.distribution = .fillEqually
            stack.axis = .horizontal
            stack.spacing = -5
            return stack
        }()
        makeCards(cardStack: cardStack, cards: hand)
        return cardStack
    }
}

