class Building

  attr_accessor :post_code, :affluency
  attr_reader :flats, :prospects

  def initialize(post_code)
    @post_code = post_code
    @flats = {}
    @prospects = {}

  end

  def list_flats
    flats.keys.join(", ")
  end

  def list_empty_flats
    vacant_flats = flats.select { |key, flat| flat.vacant?}
    if vacant_flats.empty?
      return "There are no empty flats."
    else
      vacant_flats.keys.join(", ")
    end
  end

  def list_prospects
    if prospects.empty?
      return "There are no prospective tenants."
    else 
      prospects.keys.join(", ")
    end
  end

  def list_tenants
    flats.each do |flat, value|
      if flats[flat].tenants.empty?
        puts "#{flat} is unoccupied."
      else
        puts "#{flat} is occupied by: #{flats[flat].tenants.keys.join(", ")}."
      end
    end
  end

def is_a_number(s)
  s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
end

def number_get_and_confirm
  number = gets.chomp
  while !is_a_number(number)
    print "Please only enter digits for the phone number: "
    number = gets.chomp
  end
  number.to_i
end

def create_prospect
  print "What is the name of the prospective tenant? "
  name = gets.chomp
  print "What is the phone number of the prospective tenant? "
  phone = number_get_and_confirm
  new_prospect = Person.new(name, phone)
  prospects[name] = new_prospect
end









end