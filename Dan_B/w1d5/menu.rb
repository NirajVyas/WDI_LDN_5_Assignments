def menu
  puts `clear`
  puts "********** Welcome to your Pet Management System ********\n"
  puts
  puts
  puts "1\t:\tList Available Pets"
  puts "2\t:\tList Clients"
  puts "3\t:\tList Prospects"
  puts "4\t:\tAdd Prospects"
  puts "5\t:\tAdd a Pet"
  puts "6\t:\tReceive Abandoned Pet"
  puts "7\t:\tReHome a Pet"
  puts "q\t:\tQuit"
  puts 
  print "---> \t"
  gets.chomp.downcase
end