# with each
puts 'With each'
values = []
(1..16).to_a.each do |item|
  values.push item
  if values.count == 4 
    puts values.join ' ' 
    values = []
  end 
end 

puts

#with each_slice
puts 'With each_slice'
(1..16).to_a.each_slice(4) {|item| puts item.join ' ' }



