crypt_of_civilization = Array.new

crypt_of_civilization << "Box of phonographic records"
crypt_of_civilization << "Plastic savings bank"
crypt_of_civilization << "Set of scales"
crypt_of_civilization << "Toast-O-Lator"
crypt_of_civilization << "Sample of aluminum foil"
crypt_of_civilization << "Donald Duck doll"

extra = ["Container of beer", "Lionel model train set", "Ingraham pocket watch"]

crypt_of_civilization.concat(extra)

p "Number of items: #{crypt_of_civilization.count}"
p "First item: #{crypt_of_civilization.first}"
p "Last item: #{crypt_of_civilization.last}"
p "Second item: #{crypt_of_civilization[1]}"
p "Third item: #{crypt_of_civilization[2]}"
p "Second to last item: #{crypt_of_civilization[-2]}"
p "Index of 'Toast-O-Lator': #{crypt_of_civilization.index("Toast-O-Lator")}"