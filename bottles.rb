require 'colorize'

@bottles = {
  full_bottles: 0,
  empty_bottles: 0,
  bottle_caps: 0,
  cash: 0,
  total_cash: 0,
}

#Gets user input and runs the bottle function
def run
  while true
    puts "Each bottle of pop costs $2. Enter the amount you wish to pay as a number. Or, type 'caps' to view redeemability of bottlecaps, 'empties' to view redeemability of empty bottle, 'total' to view total amount of cash paid today. Type 'exit' to quit."
    input = gets.strip
    user_options(input)
  end
end

#Responds to various user commands or exits program. 
def user_options(input)
  case input
  when /\d/
    bottle(input.to_i)
    output = "You just paid $#{@bottles[:cash]}. That'll get you #{@bottles[:cash] / 2} bottle(s) of pop."
  when 'caps'
    if @bottles[:bottle_caps] >= 4
    output = "You can redeem your caps for #{@bottles[:bottle_caps] / 4} full bottle(s) of pop."
    else
    output = "Sorry, you don't have enough caps to redeem."
  end
  when 'empties'
    if @bottles[:empty_bottles] >= 2
      output = "You can redeem your empties for #{@bottles[:full_bottles] / 2} full bottle(s) of pop."
    else
      output = "Sorry, you don't have enough empties to redeem."
  end
  when 'total'
    output = "You've paid a total of $#{@bottles[:total_cash]} today."
  when 'total'
    output = "You paid $#{@bottles[:total_cash]} today for a total of #{@bottles[:full_bottles]} full bottles of pop. You'll be able to get back #{@bottles[:full_bottles] / 2} full bottles from your empties and #{@bottles[:bottle_caps] / 4} full bottles from your caps!"
  when 'exit'
    puts "Exiting program".red
    exit
  else 
    output = "Command not recognized. Please try again."
  end
  puts "#{output}".green
end

#Algorithm to determine amounts and redeemables. Will also add updated values to the @bottles hash. 
def bottle(cash)
  @bottles[:cash] = cash
  @bottles[:full_bottles] += cash / 2
  @bottles[:empty_bottles] += cash / 4
  @bottles[:bottle_caps] += cash / 2
  @bottles[:total_cash] += cash 
end


run
