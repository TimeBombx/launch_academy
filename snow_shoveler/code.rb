height_of_snow = 8 #in inches
length_of_driveway = 20
width_of_driveway = 8

cubic_feet = (length_of_driveway * width_of_driveway * (height_of_snow / 12.0)).round(0)

quote = 0

if cubic_feet <= 49
  quote = 20
elsif cubic_feet >= 50 && cubic_feet <= 149
  quote = 50
elsif cubic_feet >= 150 && cubic_feet <= 299
  quote = 100
else
  quote = 150
end

p "Cubic feet: #{ cubic_feet }"
p "Quote is $#{quote}"