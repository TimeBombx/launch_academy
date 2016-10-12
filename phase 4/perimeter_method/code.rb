def perimeter( width, height = nil )
  if height.nil?
    4 * width
  else
    (2 * width) + (2 * height)
  end
end

puts perimeter 40, 20
puts perimeter 40