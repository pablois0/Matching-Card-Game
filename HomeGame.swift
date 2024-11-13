//
//  HomeGame.swift
//  MatchGameHome
//
//  Created by Pablo Moya  on 10/6/24.
//

import Foundation

enum CellState {
    case Hidden
    case Guessed
    case Displayed
}

struct Card {
    var name: String
    var cellState: CellState = .Hidden
}

enum GameState {
    case Hidden
    case FirstCardSelected
    case CheckMatches
    case SecondCardSelected
    case CheckMatch
}

struct MatchGame {
    
    var firstCardSelection = 0
    var secondCardSelection = 0
    var thirdCardSelection = 0
    
    //var cards = [Card](repeating: Card(name:"Gommy"), count: 24)
    var cards = [Card(name: "Marshadow"),Card(name: "Pikachu"),Card(name: "Mew"),Card(name: "Skitty"),Card(name: "Shaymin"),Card(name: "Litwick"),Card(name: "Espeon"),Card(name: "Gible"),Card(name: "Marshadow"),Card(name: "Pikachu"),Card(name: "Mew"),Card(name: "Skitty"),Card(name: "Shaymin"),Card(name: "Litwick"),Card(name: "Espeon"),Card(name: "Gible"),Card(name: "Marshadow"),Card(name: "Pikachu"),Card(name: "Mew"),Card(name: "Skitty"),Card(name: "Shaymin"),Card(name: "Litwick"),Card(name: "Espeon"),Card(name: "Gible")]
    var state: GameState = .Hidden
    
    mutating func newGame() {
        cards.shuffle()
        state = .Hidden
    }
    
    mutating func selectCardAt(tag: Int) {
        if tag < 0 || tag >= cards.count || cards[tag].cellState != .Displayed {
            print("Error!Button out of range")
            return
        }
        cards[tag].cellState = .Displayed
    }
    
    mutating func proccedSelection(at tag : Int) {
        let card = cards[tag]
        switch state {
        case .Hidden:           //All cards are hidden or guessed
            switch card.cellState {
            case .Hidden:
                cards[tag].cellState = .Displayed
                firstCardSelection = tag
                state = .FirstCardSelected
            case .Guessed, .Displayed: print("Error")
            }
        case .FirstCardSelected:
            switch card.cellState {
            case .Hidden:
                cards[tag].cellState = .Displayed
                secondCardSelection = tag
                if cards[firstCardSelection].name == cards[secondCardSelection].name {
                    //both cards matched
                    cards[firstCardSelection].cellState = .Guessed
                    cards[secondCardSelection].cellState = .Guessed
                    state = .SecondCardSelected
                } else {
                    // mismatch
                    state = .CheckMatches
                }
            case .Guessed, .Displayed:
                print("Error")
            }
        case .SecondCardSelected:
            switch card.cellState {
            case .Hidden:
                cards[tag].cellState = .Displayed
                thirdCardSelection = tag
                if cards[secondCardSelection].name == cards[thirdCardSelection].name {
                    //both cards matched
                    cards[thirdCardSelection].cellState = .Guessed
                    state = .Hidden
                } else {
                    // mismatch
                    state = .CheckMatch
                }
            case .Guessed, .Displayed:
                print("Error")
            }
        case .CheckMatches:
            cards[firstCardSelection].cellState = .Hidden
            cards[secondCardSelection].cellState = .Hidden
            state = .Hidden
        case .CheckMatch:
            cards[firstCardSelection].cellState = .Hidden
            cards[secondCardSelection].cellState = .Hidden
            cards[thirdCardSelection].cellState = .Hidden
            state = .Hidden
        }
    }
    
    func display() {
        print(cards)
    }
}

var game = MatchGame()
