# blackjack.rb

# User plays against computer in this text-based blackjack game.

# cards in deck
# player's hand
# computer's hand

# deal player and dealer 2 cards
# check if blackjack
# if true
#   player wins
# if false
#   ask player for hit or stay
#     if hit
#       check if blackjack
#       check if busted
#         if true
#           computer wins
#         if false
#           ask player for hit or stay
#     if stay
#       calculate value
#       dealer hits until > 17
#         check if blackjack
#         check if busted
#           if true
#             player wins
#           if false
#             compare player & dealer
#             higher value wins

require 'pry'

# Creates a new deck with the following data structure:
# { club: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10],
#  spade: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10], ...}
def new_deck
  deck = {club: [], spade: [], heart: [], diamond: []}
  deck.keys.each do |suit|
    (1..9).each do |num|
      deck[suit] << num
    end
    3.times { deck[suit] << 10 }
  end
  deck
end

# Checks if ace is present in a given hand.
def ace_present?(hand)
  hand.values.flatten.include?(1)
end

# Calculates and returns the total value of a hand.
# Handles the ace according to computer's expected behavior - 
# i.e. Counts ace as 11 when the total is less than 17.
def total_value(hand)
  if ace_present?(hand)
    pick out the aces
      if there is only 1 ace
        check if other cards' value 
    if 
  else
    total = 0
    hand.values.flatten.each { |val| total = total + val }
  end
  total
end

# Returns true if a hand has a blackjack.
def is_blackjack?(hand)
end


# Instantiate new deck.
new_deck
player_hand1 = { club: [1], spade: [10] }
player_hand2 = { club: [1], spade: [5] }
player_hand3 = { club: [2], spade: [3] }
binding.pry