# blackjack.rb

# User plays against computer in this text-based blackjack game.

require 'pry'

# Creates a new deck with the following data structure:
# [['H', '3'], ['S', 'Q']...]
def new_deck
  suits = ['H', 'D', 'S', 'C']
  cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  deck = suits.product(cards)
  deck.shuffle!
  deck
end

# Returns an array which contains only the numeric values of a hand.
def values(hand)
  hand.map { |card| card[1] }
end

# Checks how many aces there are in a given array.
def num_of_aces(array)
  array.count('A')
end

# Takes an array of cards and returns the sum of numeric values.
def sum_of_array(array)
  total = 0
  array.each do |val|
    if val == "A"
      total += 1
    elsif ["J", "Q", "K"].include?(val)
      total += 10
    else
      total += val.to_i
    end
  end
  total
end

# Calculates and returns the total value of a hand.
# Handles the ace according to computer's expected behavior - 
# i.e. Counts ace as 11 when the total is less than or equal to 21.
def total_value(hand)
  total = 0
  arr = values(hand)
  # If only 1 ace is present.
  if num_of_aces(arr) == 1
    # If the rest of the cards (excluding the ace) adds up to less than or equal to 10
    if (sum_of_array(arr) - 1) <= 10
      # Count ace as 11.
      total = sum_of_array(arr) + 11 - 1
    else
      # Else, count ace as 1.
      total = sum_of_array(arr)
    end
  # If more than 1 ace is present.
  elsif num_of_aces(arr) > 1
    num_of_aces = num_of_aces(arr)
    arr_no_aces = arr.delete(1)
    total = sum_of_array(arr_no_aces) + 11 + (num_of_aces - 1)
  # If there are no aces.
  else
    total = sum_of_array(arr)
  end
  total
end

# Instantiate new deck.
deck = new_deck

# Deal player and computer both 2 cards.
mycards = []
dealercards = []

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

dealertotal = total_value(dealercards)
mytotal = total_value(mycards)

# Show cards.
puts "Dealer has: #{dealercards[0]} and #{dealercards[1]}, for a total of #{dealertotal}"
puts "You have: #{mycards[0]} and #{mycards[1]}, for a total of: #{mytotal}"
puts ""

# Check if player has blackjack.
if mytotal == 21
  puts "You hit blackjack! You won!"
  exit
end

# Ask for hit or stay
 while mytotal < 21
  puts "What would you like to do? 1) hit 2) stay"
  hit_or_stay = gets.chomp
  if !((hit_or_stay == "1") || (hit_or_stay == "2"))
    puts "Please make a valid choice."
    next
  end

  # If player chooses hit.
  if hit_or_stay == "1"
    # Deal new card. Update total.
    new_card = deck.pop
    mycards << new_card
    mytotal = total_value(mycards)
    puts "Your new card is #{new_card}. Your new total is #{mytotal}."
    # Check if blackjack/busted/neither.
    if mytotal == 21
      puts "You hit blackjack! You won!"
      exit
    elsif mytotal > 21
      puts "You busted. You lost."
      exit
    end
  else
    # If player chooses stay.
    puts "You chose to stay."
    break
  end
end

# Dealer hits until >= 17
if dealertotal == 21
  puts "Dealer hit blackjack. You lost."
  exit
end

while dealertotal < 17
  new_card = deck.pop
  dealercards << new_card
  dealertotal = total_value(dealercards)
  puts "Dealer drew a new card."
  puts "Dealer's new card is #{new_card}. Dealer's new total is #{dealertotal}."
  # Check if blackjack/busted/neither.
  if dealertotal == 21
    puts "Dealer hit blackjack. You lost."
    exit
  elsif dealertotal > 21
    puts "Dealer has busted. You won!"
    exit
  end
end

# Compare player and dealer's hands.
puts "Your cards's total: #{mytotal}. Dealer's total: #{dealertotal}."
if dealertotal > mytotal
  puts "Dealer has won."
elsif mytotal > dealertotal
  puts "You won!"
else
  puts "It's a tie!"
end
