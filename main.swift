import Foundation

var my_deck = Deck()

my_deck.shuffle_Deck()

var player1 = Player()
var player2 = Player()
var player3 = Player()
var player4 = Player()

my_deck.deal_cards(player1: player1, player2: player2, player3: player3, player4: player4)

print()
print("Player 1s hand")
player1.print_hand()
print()
print("Player 2s hand")
player2.print_hand()
print()
print("Player 3s hand")
player3.print_hand()
print()
print("Player 4s hand")
player4.print_hand()

print()
print("Player 1s hand")
print(player1.makebid())
print()
print("Player 2s hand")
print(player2.makebid())
print()
print("Player 3s hand")
print(player3.makebid())
print()
print("Player 4s hand")
print(player4.makebid())

var game1 = Game()

game1.play_trick(player1: player1, player2: player2, player3: player3, player4: player4)


