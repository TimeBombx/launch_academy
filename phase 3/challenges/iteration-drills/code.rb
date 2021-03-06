#Write Ruby<->English answers here as comments in your code

# 1. for every element called number in numbers array, print out 3 times that number
# 2. for every element called name in names array, print the length of the name
# 3. create a varible called sum and set it equal to zero. for every element, called number, in numbers, add number to sum. print out sum
# 4. for every key-pair, name and age, print out "name" is "age" years old
# 5. create a new varible called sum. for every key-pair, transaction and value, add value to sum. print out the sum
# 6. for every key-pair, name and address, print out "name" is "address" years old

array = [28214, 63061, 49928, 98565, 31769, 42316, 23674, 3540, 34953, 70282, 22077, 94710, 50353, 17107, 73683, 33287, 44575, 83602, 33350, 46583]

# Write Ruby code to find out the answers to the following questions:

# * What is the sum of all the numbers in `array`?
sum = 0
array.each { |num| sum += num }
puts "sum of all nums: #{ sum }"
# * How would you print out each value of the array?
puts "Each value of the array: "
array.each { |value| puts "> #{value}" }
# * What is the sum of all of the even numbers?
even = 0
array.find_all { |e| e % 2 == 0  }.each { |num| even += num }
puts "sum of all even nums: #{ even }"
# * What is the sum of all of the odd numbers?
odd = 0
array.find_all { |e| e % 1 == 0  }.each { |num| odd += num }
puts "sum of all even nums: #{ odd }"
# * What is the sum of all the numbers divisble by 5?
puts "sum of all the numbers divisble by 5: #{ sum / 5.0 }"
# * What is the sum of the squares of all the numbers in the array?
puts "sum of the squares of all the numbers in the array: #{ sum**2 }"


array = ["joanie", "annamarie", "muriel", "drew", "reva", "belle", "amari", "aida", "kaylie", "monserrate", "jovan", "elian", "stuart", "maximo", "dennis", "zakary", "louvenia", "lew", "crawford", "caitlyn"]

# Write Ruby code to find out the answers to the following questions:
puts "Each value of the reversed array: "
array.reverse.each { |value| puts "> #{value}" }
# * How would you print out each name backwards in `array`?
puts "Each value of the array backwards: "
array.each { |value| puts "> #{value.reverse}" }
# * What are the total number of characters in the names in `array`?
puts "total number of chars in the array: #{ array.join("").length }"
# * How many names in `array` are less than 5 characters long?
puts "Names in the array that are less than 5 chars: #{ array.find_all { |value| value.length < 5 }.count }"
# * How many names in `array` are more than 5 characters long?
puts "Names in the array that are more than 5 chars: #{ array.find_all { |value| value.length > 5 }.count }"
# * How many names in `array` are exactly 5 characters in length?
puts "Names in the array that are exactly 5 chars: #{ array.find_all { |value| value.length == 5 }.count }"

best_records = {
  "Tupac"=>"All Eyez on Me",
  "Eminem"=>"The Marshall Mathers LP",
  "Wu-Tang Clan"=>"Enter the Wu-Tang (36 Chambers)",
  "Led Zeppelin"=>"Physical Graffiti",
  "Metallica"=>"The Black Album",
  "Pink Floyd"=>"The Dark Side of the Moon",
  "Pearl Jam"=>"Ten",
  "Nirvana"=>"Nevermind"
}

#  Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of the artists?
puts "Names of the artists: "
best_records.each { |key,value| puts "> #{ key }" }
# * How would you print out all the names of the albums?
puts "Names of the albums: "
best_records.each { |key,value| puts "> #{ value }" }
# * Which artist has the longest name?
puts "Artist with the longest name: #{ best_records.keys.max { |value| value.length } }"
# * How would you change all the album titles for every artist to `Greatest Hits`?
puts best_records.each { |key,value| best_records[key] = "Greatest Hits" }
# * How would you delete a key-value pair if the artist's name ends in a vowel?


ages = {"Arch"=>89, "Gretchen"=>93, "Simone"=>12, "Daija"=>96, "Alivia"=>22, "Serena"=>28, "Alek"=>3, "Lula"=>24, "Christian"=>62, "Darryl"=>47, "Otha"=>32, "Evalyn"=>44, "Lincoln"=>27, "Rebeca"=>99, "Beatrice"=>99, "Kelton"=>10, "Zachary"=>18, "Aurelie"=>91, "Dell"=>71, "Lisandro"=>22}

# Write Ruby code to find out the answers to the following questions:
puts
# * How would you print out all the names of `ages`?
puts
puts "Names: "
ages.each { |key,value| puts key }
# * How would you print out each key-value pair in the format of `<name> is <age> years old.`?
puts
ages.each { |key,value| puts "#{key} is #{value} years old." }
# * How would you print out every person with odd numbered age?
puts
ages.each { |key,value| puts key if value % 1 == 0 }
# * How would you delete everyone under 25 years of age?
puts
ages.delete_if { |key,value| value < 25 }
# * What is the name and age of everyone with a name greater than or equal to 5 characters?
puts
ages.each { |key,value| puts "#{key} is #{value} years old." if key.length >= 5 }

people =
{
  "Alia O'Conner PhD" => {
    "phone" => "538.741.1841",
    "company" => "Leuschke-Stiedemann",
    "children" => [
      "Simone",
      "Cindy",
      "Jess"
    ]
  },
  "Ike Haag" => {
    "phone" => "(661) 663-8352",
    "company" => "Carter Inc",
    "children" => [
      "Joe",
      "Ofelia",
      "Deron"
    ]
  },
  "Brian Heller" => {
    "phone" => "1-288-601-5886",
    "company" => "O'Conner Group",
    "children" => [
      "Renee"
    ]
  },
  "Maryse Johns" => {
    "phone" => "218-571-8774",
    "company" => "Kuhlman Group",
    "children" => [
      "Dominick",
      "Tricia"
    ]
  },
  "Dr. Adela DuBuque" => {
    "phone" => "1-203-483-1226",
    "company" => "Heidenreich, Nietzsche and Dickinson"
  }
}

# Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of `people`?
puts
puts "Names: "
people.each { |key,value| puts key }
# * How would you print out all the names of `people` and which company they work for?
puts
people.each { |key,value| puts "#{ key } works for #{ people[key]["company"] }" }
# * What are the names of all the children of everyone in `people`?
puts
people.each do |key,value|
  if people[key].has_key? "children"
    puts "#{ key } children are: "
    people[key]["children"].each { |value| puts "> #{ value }" }
  else
    puts "#{ key } doesn't have children."
  end
end
# * What are the names of all the companies that people work for?
puts
people.each { |key,value| puts people[key]["company"] }

people =
[
  {
    "Derek Wehner" => {
      "phone" => "588-047-7782",
      "company" => "Daniel-Carroll",
      "children" => [
        "Phoebe",
        "Gretchen",
        "Wiley"
      ]
    },
    "Ali Koelpin" => {
      "phone" => "1-127-057-0020",
      "company" => "Rau, Rutherford and Lockman",
      "children" => [
        "Juwan"
      ]
    },
    "Ervin Prohaska" => {
      "phone" => "(393) 630-3354",
      "company" => "Carter Inc",
      "children" => [
        "Virgil",
        "Piper",
        "Josianne"
      ]
    },
    "Hellen Borer" => {
      "phone" => "1-687-825-0947",
      "company" => "Maggio, Ferry and Moen"
    }
  },
  {
    "Elinor Johnson" => {
      "phone" => "819.911.5553",
      "company" => "Pollich Group"
    }
  },
  {
    "Richmond Murray" => {
      "phone" => "1-516-432-2364",
      "company" => "Sporer and Sons",
      "children" => [
        "Kade",
        "Sage"
      ]
    },
    "Nakia Ferry" => {
      "phone" => "134-079-2237",
      "company" => "Hamill, O'Keefe and Lehner",
      "children" => [
        "Rollin"
      ]
    }
  }
]

# Write Ruby code to find out the answers to the following questions:

# * What are the names of everyone in `people`?
puts
people.each { |value| value.each { |key,value| puts key } }
# * What are the names of all the children in `people`?
puts
people.each { |value| value.each { |key,val| puts val["children"] if val.has_key? "children" } }

# * How would you create a new hash called `phone_numbers` that has a key of a name and value of a phone number in `people`?
puts
phone_numbers = Hash.new
people.each do |value|
  value.each do |key,val|
    phone_numbers[key] = val["phone"]
  end
end

puts phone_numbers

# * How would you create a new hash called `employers` that has a key of a name and a value of a company name in `people`?
puts
employers = Hash.new
people.each do |value|
  value.each do |key,val|
    employers[key] = val["company"]
  end
end

puts employers


# * How would you create a new hash called `children_count` that has a key of a name and a value of the number of children a person has?
puts
children_count = Hash.new
people.each do |value|
  value.each do |key,val|
    children_count[key] = val["children"].count if val.has_key? "children"
  end
end

puts children_count
