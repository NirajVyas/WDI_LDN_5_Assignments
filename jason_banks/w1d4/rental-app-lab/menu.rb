def menu
  puts `clear`
  puts "*** Welcome to Building Management v.01 (beta) ***\n\n"
  puts "1: List Flats"
  puts "2: Add a Flat"
  puts "3: List Tenants"
  puts "4: Let a Flat"
  puts "5: List Empty Flats"
  puts "6: List Prospects"
  puts "7: Create a Prospect"
  puts "8: Evict Tenant"
  puts "9: Calculate Rental Income"
  
  puts "Q: Quit"
  print "---->  "
  gets.chomp


end

def let_flat(building)
  print "Which flat (#{building.list_empty_flats})? "

  flat_name = gets.chomp
  print "Which prospect? "
  prospect_name = gets.chomp

  prospect = building.prospects.delete(prospect_name)
  flat = building.flats[flat_name]

  if prospect && flat && flat.vacant?
    flat.tenants[prospect.name] = prospect
    puts "\n#{prospect_name} has been allocated #{flat_name}."
  else
    puts "Either the flat or the prospect name is invalid."
  end

end

def evict_tenant(building)
  print "Which flat (#{building.list_flats})? "
  flat_name = gets.chomp
  flat = building.flats[flat_name]

  if flat && !flat.vacant?
    print "\nEvict which tenant (#{flat.tenants.keys.join(", ")})? "
    eviction_decision = gets.chomp
    if flat.tenants[eviction_decision]
      flat.tenants.delete(eviction_decision)
      puts "\n#{eviction_decision} has/have been evicted."
    else
      puts "\nInvalid choice."
    end
  elsif flat && flat.vacant?
    puts "\nThis flat is vacant."
  else
    puts "\nInvalid choice."
      
  end
end






