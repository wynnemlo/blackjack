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

# Returns a flattened array which contains only the numeric values of a hand.
def values(hand)
  hand.values.flatten
end

# Checks how many aces there are in a given hand.
def num_of_aces(hand)
  values(hand).count(1)
end

# Takes a flattened hand and returns the sum of numeric values.
def sum_of_array(flattened_hand)
  total = 0
  flattened_hand.each { |val| total = total + val }
  total
end

# Calculates and returns the total value of a hand.
# Handles the ace according to computer's expected behavior - 
# i.e. Counts ace as 11 when the total is less than 17.
def total_value(hand)
  total = 0
  binding.pry
  # If only 1 ace is present.
  if num_of_aces(hand) == 1
    # If the rest of the cards (excluding the ace) adds up to less than or equal to 10
    if (sum_of_array(values(hand)) - 1) <= 10
      binding.pry
      # Count ace as 11.
      total = sum_of_array(values(hand)) + 11 - 1
    else
      binding.pry
      # Else, count ace as 1.
      total = sum_of_array(values(hand))
    end
  # If more than 1 ace is present.
  elsif num_of_aces(hand) > 1
    num_of_aces = num_of_aces(hand)
    aces_removed_arr = values(hand).delete(1)
    total = sum_of_array(aces_removed_arr) + 11 + (num_of_aces - 1)
  # If there are no aces.
  else
    total = sum_of_array(values(hand))
  end
  binding.pry
  total
end

# Instantiate new deck.
new_deck

# Deal player and computer both 2 cards.

player_hand1 = { club: [2, 1], spade: [10]}
player_hand2 = { club: [1], spade: [5] }
player_hand3 = { club: [2], spade: [3], spade: [1]}
player_hand4 = { club: [2], spade: [3], spade: [5]}
binding.pry