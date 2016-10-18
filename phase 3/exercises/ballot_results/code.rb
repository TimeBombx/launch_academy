#build vote results
vote_results = []
4.times do |precinct_index|
  vote_results[precinct_index] = []
  3.times do |candidate_index|
    vote_results[precinct_index][candidate_index] = rand(20..500)
  end
end

candidates = [
  'Mary Sue',
  'Sally Jane',
  'Billy Joe'
]

#list out vote results
vote_results.each_with_index do |precinct_results, precinct_index|
  puts "**In precinct #{precinct_index + 1}:**"

  candidates.each_with_index do |candidate, candidate_index|
    puts "* #{candidate} got #{vote_results[precinct_index][candidate_index]} votes"
  end

  puts ""
end

### put your code here
puts "Precinct 1 had #{ vote_results[0].inject(0, :+) } votes"

candidate = vote_results[3].index(vote_results[3].max)

puts "#{ candidates[candidate] } won precinct 4"

mary_votes = 0
billy_votes = 0
sally_votes = 0

vote_results.length.times do |precinct_index|
  mary_votes += vote_results[precinct_index][0]
  billy_votes += vote_results[precinct_index][1]
  sally_votes += vote_results[precinct_index][2]
end

puts "Mary Sue had #{ mary_votes } votes"
puts "Billy Joe had #{ billy_votes } votes"
puts "Sally Jane had #{ sally_votes } votes"

votes = [ mary_votes, sally_votes, billy_votes ]

puts "There was #{ votes.inject(0, :+) } vots in total"
puts "#{ candidates[votes.index(votes.max)] } had the most votes. (#{ votes.max })"
