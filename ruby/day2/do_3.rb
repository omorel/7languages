puts 'Please insert your filename'
filename = gets.chomp
puts 'Please insert the word you\'re looking for'
word = gets.chomp

filename= 'do_2.rb'
if (File.readable?(filename)) 
  regexp = Regexp.new(Regexp.escape(word))
  results = IO.readlines(filename).each_with_index do |line, nb|
    puts "#{nb+1} : #{line}" if regexp.match(line)
  end 
end 