import Foundation
import Cocoa

enum Suit: String, CaseIterable{
    case spades = "♠️"
    case hearts = "♥️"
    case diamonds = "♦️"
    case clubs = "♣️"
}

enum Rank: String, CaseIterable{
    case two = "Two"
    case three = "Three"
    case four = "Four"
    case five = "Five"
    case six = "Six"
    case seven = "Seven"
    case eight = "Eight"
    case nine = "Nine"
    case ten = "Ten"
    case jack = "Jack"
    case queen = "Queen"
    case king = "King"
    case ace = "Ace"
}



struct Card {
    
    let suit : Suit
    let rank : Rank
    var value : Int
    
    func print_card(){
        print("\(rank.rawValue) of \(suit.rawValue)", terminator:"")
    }
}

//Be the first player to reach 500 points
//Object of each hand is to win at least as many tricks as you bid

//random dealer
//deal 12 cards ro each player
//Bids are made- expectation of tricks

//Dealer goes first, and places a lead and then the rest of the players must follow that suit
// If you don't have then lead you can play any card
//Card with highest rank in the suit wins the round

//Recieve 10 points for each bid made and +1 over initial bid
//0 points to fail
//making bids just look at the cards, cards with value > a certain number count those and then bid that num
//Add you and your partners bid together
class Deck {
    
    var cards : [Card] = []
    
    init(){
        for suit in Suit.allCases {
            for rank in Rank.allCases{
                if suit == .spades {
                    switch rank {
                    case .two:
                        cards.append(Card(suit: suit, rank: rank, value: 20))
                    case .three:
                        cards.append(Card(suit: suit, rank: rank, value: 22))
                    case .four:
                        cards.append(Card(suit: suit, rank: rank, value: 23))
                    case .five:
                        cards.append(Card(suit: suit, rank: rank, value: 24))
                    case .six:
                        cards.append(Card(suit: suit, rank: rank, value: 25))
                    case .seven:
                        cards.append(Card(suit: suit, rank: rank, value: 26))
                    case .eight:
                        cards.append(Card(suit: suit, rank: rank, value: 27))
                    case .nine:
                        cards.append(Card(suit: suit, rank: rank, value: 28))
                    case .ten:
                        cards.append(Card(suit: suit, rank: rank, value: 29))
                    case .jack:
                        cards.append(Card(suit: suit, rank: rank, value: 30))
                    case .queen:
                        cards.append(Card(suit: suit, rank: rank, value: 31))
                    case .king:
                        cards.append(Card(suit: suit, rank: rank, value: 32))
                    case .ace:
                        cards.append(Card(suit: suit, rank: rank, value: 33))
                    }
                    
                }
                else {
                    switch rank {
                    case .two:
                        cards.append(Card(suit: suit, rank: rank, value: 1))
                    case .three:
                        cards.append(Card(suit: suit, rank: rank, value: 2))
                    case .four:
                        cards.append(Card(suit: suit, rank: rank, value: 3))
                    case .five:
                        cards.append(Card(suit: suit, rank: rank, value: 4))
                    case .six:
                        cards.append(Card(suit: suit, rank: rank, value: 5))
                    case .seven:
                        cards.append(Card(suit: suit, rank: rank, value: 6))
                    case .eight:
                        cards.append(Card(suit: suit, rank: rank, value: 7))
                    case .nine:
                        cards.append(Card(suit: suit, rank: rank, value: 8))
                    case .ten:
                        cards.append(Card(suit: suit, rank: rank, value: 9))
                    case .jack:
                        cards.append(Card(suit: suit, rank: rank, value: 10))
                    case .queen:
                        cards.append(Card(suit: suit, rank: rank, value: 11))
                    case .king:
                        cards.append(Card(suit: suit, rank: rank, value: 12))
                    case .ace:
                        cards.append(Card(suit: suit, rank: rank, value: 13))
                    }
                }
            }
        }
    }
    
    
    //deal 13 cards ro each player
    func deal_cards(player1 : Player, player2 : Player, player3 :Player, player4 : Player){
        self.cards.shuffle()
        
        for _ in cards{
            while !(cards.isEmpty){
                player1.hand.append(self.cards[0])
                self.cards.remove(at: 0)
                player2.hand.append(self.cards[0])
                self.cards.remove(at: 0)
                player3.hand.append(self.cards[0])
                self.cards.remove(at: 0)
                player4.hand.append(self.cards[0])
                self.cards.remove(at: 0)
            }
        }
        
    }
    
    func print_Deck(){
        for card in cards {
            print("\(card.rank.rawValue) of \(card.suit.rawValue)")
        }
        
    }
    
    func shuffle_Deck(){
        cards.shuffle()
        for card in cards{
            print(card.suit.rawValue, card.rank.rawValue, card.value)
        }
        
    }
    
}

var table : [Card] = []


class Player{
    var hand : [Card] = []
    var tricks = 0
    var score = 0
    var bid = 0

    
    func print_hand() {
        
        for card in hand{
            print("(\(card.rank) of \(card.suit.rawValue))", terminator: "")
        }
    }
    
    //Player looks at cards, if they have a spade or queen or king they will alter cards based on that
    func makebid()-> Int{
        var bid = 0
         for card in hand {
             if card.suit == .spades || card.rank == .king || card.rank == .queen {
                 bid += 1
             }
        }
        return bid
    }
    
    func print_player() {
        
    }
}

class Game {
    
    //Game loop
    func play_trick(player1 : Player, player2 : Player, player3 :Player, player4 : Player){
        
        let playing = [player1, player2, player3, player4]
        
        for _ in 0...player1.hand.count {
            for player in playing {
                //Play a high card if you have it
                for (i, card) in player.hand.enumerated() {
                    if card.suit == .spades || card.rank == .queen || card.rank == .king {
                        print("\(player) plays \(card.print_card())")
                        table.append(card)
                        player.hand.remove(at: i)
                        break
                    }
                    else {
                        //*Implement a way to play a random card*
                        //Play first card from your hand
                        let firstCard = player.hand[0]
                        print("\(player) plays \(firstCard.print_card())")
                        table.append(firstCard)
                        player.hand.remove(at: 0)
                        break
                    }
                }
            }
        
        //Check all the cards in the table and the winning trick goes to the highest card
        var maxValue = table[0]
        var winnerIndex = 0
        
        for (i, card) in table.enumerated() {
            if card.value > maxValue.value{
                maxValue = card
                winnerIndex = i
            }
        }
        print("Winning card is \(maxValue)")
        print("\(playing[winnerIndex]) wins the trick")
        
        //Give points to the winning player
        playing[winnerIndex].tricks += 1
    }
        //Recieve 10 points for each bid made and +1 over initial bid
        //0 points to fail
        //making bids just look at the cards, cards with value > a certain number count those and then bid that num
        
        for player in playing{
            if player.tricks >= player.bid {
                player.score = player.bid * 10 + ((player.tricks - player.bid))
            }
            else {
                player.score = 0
            }
        }
        //Add you and your partners bid together
        let team1 = player1.score + player3.score
        let team2 = player2.score + player4.score
        
        if team1 > team2{
            print("TEAM 1 WINS")
        }
            print("TEAM WINS")
        }
    
    }

    

