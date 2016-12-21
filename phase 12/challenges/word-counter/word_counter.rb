# YOUR CODE HERE
text_file = ARGV[0]
number_of_words = ARGV[1].to_i

if ARGV.size > 1
  puts "The top #{number_of_words} words found in #{text_file}:"

  words_hash = {}
  File.open(text_file, "r") do |file|
    data = file.read
    sanitized = data.gsub(/[,.!?;:*&"]/, '').downcase

    words = sanitized.split
    words.each do |word|
      if words_hash[word]
        words_hash[word] += 1
      else
        words_hash[word] = 1
      end
    end
  end

  top_words_hash = words_hash.sort_by { |key, value| value }.reverse[0..number_of_words - 1]

  i = 1
  top_words_hash.each do |w|
    puts "#{i}. #{w[0]}: #{w[1]}"
    i += 1
  end
else
  puts "Need a file name and the number of words you want"
end