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

# Calculates and returns the total value of a hand.
def total_value(hand)
  # If Ace is present
  if hand.values.flatten.include?(1)
    total = 0
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