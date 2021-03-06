campaign_data = [
  { first_name: "Jon", last_name: "Smith", age: 25, income: 50000, house_size: 1, gender: "male", education: "College" },
  { first_name: "Jane", last_name: "Davies", age: 30, income: 60000, house_size: 3, gender: "Female", education: "High School" },
  { first_name: "Sam", last_name: "Farelly", age: 32, income: 80000, house_size: 2, gender: "Unspecified", education: "College" },
  { first_name: "Joan", last_name: "Favreau", age: 35, income: 65000, house_size: 4, gender: "Female", education: "College" },
  { first_name: "Sam", last_name: "McNulty", age: 38, income: 63000, house_size: 3, gender: "Male", education: "College" },
  { first_name: "Mark", last_name: "Minahan", age: 48, income: 78000, house_size: 3, gender: "Male", education: "High School" },
  { first_name: "Susan", last_name: "Umani", age: 45, income: 75000, house_size: 2, gender: "Female", education: "College" },
  { first_name: "Bill", last_name: "Perault", age: 24, income: 45000, house_size: 1, gender: "Male", education: "Did Not Complete High School" },
  { first_name: "Doug", last_name: "Stamper", age: 45, income: 75000, house_size: 1, gender: "Male", education: "College" },
  { first_name: "Francis", last_name: "Underwood", age: 52, income: 100000, house_size: 2, gender: "Male", education: "College" }
]

def average( sym, campaign_data )
  average = 0.0
  campaign_data.each do |data|
    average += data[sym]
  end
  average / campaign_data.size
end

puts "Average Age: #{ average(:age, campaign_data) }"
puts "Average Income: #{ average(:income, campaign_data) }"
puts "Average Household Size: #{ average(:house_size, campaign_data) }"
puts "Female %: #{ (campaign_data.select { |data| data[:gender].downcase == "female" }.count / campaign_data.count.to_f) * 100.to_f }"
puts "Male %: #{ (campaign_data.select { |data| data[:gender].downcase == "male" }.count / campaign_data.count.to_f) * 100.to_f }"
puts "Unspecified %: #{ (campaign_data.select { |data| data[:gender].downcase == "unspecified" }.count / campaign_data.count.to_f) * 100.to_f }"
puts "College %: #{ (campaign_data.select { |data| data[:education].downcase == "college" }.count / campaign_data.count.to_f) * 100.to_f }"
puts "High School %: #{ (campaign_data.select { |data| data[:education].downcase == "high school" }.count / campaign_data.count.to_f) * 100.to_f }"
puts "Did Not Finish High School %: #{ (campaign_data.select { |data| data[:education].downcase == "did not complete high school" }.count / campaign_data.count.to_f) * 100.to_f }"
