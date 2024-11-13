//
//  ViewController.swift
//  MatchGameHome
//
//  Created by Pablo Moya  on 10/6/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var CardsButton: [UIButton]!
    @IBOutlet var NewGameButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCardsOnButton()
        newGameButton()
    }

    func showCardsOnButton(){
        for tag in 0..<game.cards.count {
            if game.cards[tag].cellState == .Hidden{
                CardsButton[tag].setImage(UIImage(named: "Goomy") , for: .normal)
            } else {
                let name = game.cards[tag].name
                CardsButton[tag].setImage(UIImage(named: name) , for: .normal)

            }
        }
    }
    
    func newGameButton(){
        for tag in 0..<game.cards.count{
            game.cards[tag].cellState = .Hidden
            if game.cards[tag].cellState == .Hidden{
                CardsButton[tag].setImage(UIImage(named: "Goomy") , for: .normal)
            } else {
                let name = game.cards[tag].name
                CardsButton[tag].setImage(UIImage(named: name) , for: .normal)

            }
        }
    }
    
    
    @IBAction func pressed(_ sender: UIButton) {
        game.proccedSelection(at: sender.tag)
        showCardsOnButton()
    }
    
    
    @IBAction func pressedNewGame(_ sender: UIButton) {
        game.newGame()
        newGameButton()
    }
    
}

