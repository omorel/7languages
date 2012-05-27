#generate the answer 
answer = rand(10) + 1
guess = 0

puts 'Try to guess the randomly generated value (1-10)'

while guess != answer
  #read the user input and convert it to an integer 
  guess = gets.to_i
  
  #give the user a hint 
  if guess < answer
    puts 'Your guess is too low'
  elsif guess > answer 
    puts 'Your guess is too high'
  end
end 

puts "Congratulation you've found the right answer" 