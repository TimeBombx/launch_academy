def greet( name )
  greeting = [ "Hi", "Yo", "Hey", "Howdy" ].sample
  puts "#{greeting}, #{name}!"
end

def greet_with_language(name, language = nil)
  if language == 'spanish'
    puts "Hola, #{name}!"
  elsif language == 'italian'
    puts "Ciao, #{name}!"
  elsif language == 'french'
    puts "Bonjour, #{name}!"
  else
    puts "Hi, #{name}!"
  end
end

greet "Corey"
greet_with_language "Corey"