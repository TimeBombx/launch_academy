transactions = [50_000, -2_000, -25_000, 4_000, -12_000, 5_000, -800, -900, 43_000, -30_000, 15_000, 62_000, -50_000, 42_000]

# Write Ruby code to find out the answers to the following questions:

# * What is the value of the first transaction?
puts "first transaction: #{ transactions[0] }"
# * What is the value of the second transaction?
puts "second transaction: #{ transactions[1] }"
# * What is the value of the fourth transaction?
puts "fourth transaction: #{ transactions[3] }"
# * What is the value of the last transaction?
puts "last transaction: #{ transactions[-1] }"
# * What is the value of the second from last transaction?
puts "second from last transaction: #{ transactions[-2] }"
# * What is the value of the 5th from last transaction?
puts "5th from last transaction: #{ transactions[-2] }"
# * What is the value of the transaction with index 5?
puts "transaction with index 5: #{ transactions[5] }"
# * How many transactions are there in total?
puts "total transactions: #{ transactions.count }"
# * How many positive transactions are there in total?
puts "total positive transactions: #{ transactions.find_all { |obj| obj > 0 } }"
# * How many negative transactions are there in total?
puts "total negative transactions: #{ transactions.find_all { |obj| obj < 0 } }"
# * What is the largest withdrawal?
puts "largest withdrawal: #{ transactions.max }"
# * What is the largest deposit?
puts "largest withdrawal: #{ transactions.min }"
# * What is the smallest withdrawal?
puts "smallest withdrawal: #{ transactions.find_all { |obj| obj < 0 }.max }"
# * What is the smallest deposit?
puts "smallest deposit: #{ transactions.find_all { |obj| obj > 0 }.min }"
# * What is the total value of all the transactions?
total_transaction = 0
transactions.each { |tran| total_transaction += tran }
puts "total value of all transactions: #{ total_transaction }"
# * If Dr. Dre's initial balance was $239,900 in this account, what is the value of his balance after his last transaction?
puts "Dre's balance: #{ 239900 - transactions[-1] }"

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

# Write Ruby code to find out the answers to the following questions:
puts

# * How many records are in `best_records`?
puts "total records: #{ best_records.values.count }"
# * Who are all the artists listed?
puts "total records: #{ best_records.keys.count }"
# * What are all the album names in the hash?
puts "All albums:"
best_records.each{ |artist, albums| puts "> #{ albums }" }
# * Delete the `Eminem` key-value pair from the list.
best_records.delete("Eminem")
best_records.each{ |artist, albums| puts "> #{ albums }" }
# * Add your favorite musician and their best album to the list.
best_records["Eminem"] = "The Marshall Mathers LP"
best_records.each{ |artist, albums| puts "> #{ albums }" }
# * Change `Nirvana`'s album to another.
best_records["Nirvana"] = "In Utero"
best_records.each{ |artist, albums| puts "> #{ albums }" }
# * Is `Nirvana` included in `best_records`?
puts "Nirvana included? #{ best_records.include? "Nirvana" }"
# * Is `Soundgarden` included in `best_records`?
puts "Soundgarden included? #{ best_records.include? "Soundgarden" }"
# * If `Soundgarden` is not in `best_records` then add a key-value pair for the band.
best_records["Soundgarden"] = "Superunknown" if best_records.include? "Soundgarden"
best_records.each{ |artist, albums| puts "> #{ albums }" }
# * Which key-value pairs have a key that has a length less than or equal to 6 characters?
puts "Key less than or equal to 6 chars: #{ best_records.find { |key, value| key.length <= 6 }[0] }"
# * Which key-value pairs have a value that is greater than 10 characters?
puts "Key greater than or equal to 10 chars: #{ best_records.find { |key, value| value.length >= 10 }[1] }"
