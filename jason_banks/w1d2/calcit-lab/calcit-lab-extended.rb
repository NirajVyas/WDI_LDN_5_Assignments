# Function definitions first

def is_a_number(s)
  s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
end

def number_confirm
  puts "Please enter the number: "
  number = gets.chomp
  while !is_a_number(figure)
    puts "Please enter a number: "
    number = gets.chomp
  end
  number = number.to_f
end

def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***CalcIt***"
  print "(b)asic, (a)dvanced, (o)ther or (q)uit: "
  gets.chomp.downcase
end


def basic_calc
  # ask the user which operation they want to perform
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase

  print "First Number? "
  num1 = gets.chomp.to_f
  print "Second Number? "
  num2 = gets.chomp.to_f



  case operation
  when "a"
    puts  num1 + num2
  when "s"
    puts num1 - num2
  when "m"
    puts num1 * num2
  when "d"
    puts num1 / num2
  end
end

def advanced_calc
  # ask the user which operation they want to perform
  print "(p)ower, (s)quare root: "
  operation = gets.chomp.downcase

case operation

def other_calcs
  print "(m)ortgage, (b)mi or (t)rip:"
  operation = gets.chomp.downcase
  while !is_a_number(operation)
    puts "Please input a number"
  case operation
  when "m"
    mortgage_calc
  when "b"
    bmi_calc
  when "t"
    trip_calc
  else
    puts "Please choose one of the provided operations."
  end
end

def mortgage_calc
  puts "Principal: "
  if gets.chomp.is_a? Numeric

when "p"
  print "First Number? "
  num1 = gets.chomp.to_f
  print "Second Number? "
  num2 = gets.chomp.to_f
  puts  num1 ** num2
when "s"
  print "Number to be square rooted? "
  num1 = gets.chomp.to_f
  puts Math.sqrt(num1)
end

end


# run the app...

response = menu

while response != 'q'
  case response
  when 'b'
    basic_calc
  when 'a'
    advanced_calc
  end

puts "Hit enter to continue..."
gets


response = menu
end