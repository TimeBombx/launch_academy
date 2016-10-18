def print_grid ( board )
  board.each do |row|
    row.each_with_index do |a, index|
      print "#{a||" "}"
      print " | " if index < row.count - 1
    end
    puts
  end
end

board_a = [
  ['x', 'o', 'x'],
  ['x', nil, 'o'],
  ['x', 'o', nil],
]

board_b = [
  [nil, 'o', 'x'],
  ['x', 'o', nil],
  ['x', 'o', nil]
]

print_grid board_a
puts 
print_grid board_b