def menu
  puts 'clear'
  puts "***Welcome to Building Management v.01 (beta) ***"
  puts "1 : List Flats"
  puts "2 : List Prospects"
  puts "3 : Let Flat"
  puts "4 : Evict Tenant"
  puts "5 : List Empty Flats"
  puts "6 : List Tenants"
  puts "7 : Create a Prospect"
  puts "q : Quit"
  print '--->'
  gets.chomp
end

def let_flat(building)
  print 'Which flat? '
  print "(#{building.list_empty_flats}) "
  flat_name = gets.chomp
  print  'Which Prospect? '
  # todo- write list of prospects
  prospect_name = gets.chomp
  flat = building.flats[flat_name]

  if prospect && flat && flat.vacant?
    flat.tenants[prospect.name] = prospect
    puts "#{prospect_name} has moved into #{flat_name}" 
  else 
    puts "Either the flat or the prospect name is invalid."
  end
  puts "press enter and continue"

end