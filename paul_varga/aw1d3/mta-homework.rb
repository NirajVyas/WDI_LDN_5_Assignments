# Define data 
Lines = {"n" => 
          ["ts", "34th", "28th", "n23rd", "us", "8th"],
         "l" =>
          ["8th", "6th", "us", "3rd", "1st"],
         "s" =>
          ["gc", "33rd", "28th", "s23rd", "us", "ap"] 
          }

starting_line = 0
end_line = 0

# def starting_station
#   gets.chomp
# end

# def end_station
#   gets.chomp
# end

puts "Hello, which line do you take today?"
print "(n) line , (l) line , (s) line , "
until starting_line == "n" || starting_line == "l" || starting_line == "s" 
  starting_line = gets.chomp
end

case starting_line
when "n"
  puts "Which station do you want to start?"
  puts "ts, 34th, 28th, n23rd, us, 8th"
  starting_station = gets.chomp
  # starting_station
when "l"
  puts "Which station do you want to start?"
  puts "8th, 6th, us, 3rd, 1st"
  starting_station = gets.chomp
  # starting_station
when "s"
  puts "Which station do you want to start?"
  puts "gc, 33rd, 28th, s23rd, us, ap"
  starting_station = gets.chomp
  # starting_station
end

puts "Which line do you want to end?"
print "(n) line , (l) line , (s) line , "
until end_line == "n" || end_line == "l" || end_line == "s" 
  end_line = gets.chomp
end

case end_line
when "n"
  puts "Which station do you want to get off?"
  puts "ts, 34th, 28th, n23rd, us, 8th"
  end_station = gets.chomp
  # end_station
when "l"
  puts "Which station do you want to get off?"
  puts "8th, 6th, us, 3rd, 1st"
  end_station = gets.chomp
  # end_station
when "s"
  puts "Which station do you want to get off?"
  puts "gc, 33rd, 28th, s23rd, us, ap"
  end_station = gets.chomp
  # end_station
end

first_line = Lines[starting_line].index(starting_station)
second_line = Lines[end_line].index(end_station)
us_on_the_startline = Lines[starting_line].index("us")
us_on_the_endline = Lines[end_line].index("us")

if starting_line == end_line
  number_of_stops = second_line - first_line
else
  number_of_stops = (us_on_the_endline - second_line) + (us_on_the_startline - first_line)
end

result = number_of_stops.to_i.abs

puts "You will need #{result} stops to reach the desired station."
