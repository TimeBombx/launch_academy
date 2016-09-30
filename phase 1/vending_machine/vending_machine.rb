items_we_have = "chips popcorn skittles clif-bar mentos gum cheetos m&ms"

p "What item would you like?"
item = gets.chomp

item_index = items_we_have.index(item)

if item_index == nil
  p "We don't have that item"
elsif
  p "Item Index: "
  p item_index
end