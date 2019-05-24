map_data = []

loop do
	puts "Description:"
	description = gets.chomp
	if description == "stop"
		break
	else
	map_data << description
	end
end

puts "Map data:"
puts map_data
puts "Save?"

input = gets.chomp

if input == "yes"
	puts "Filename:"
	filename = gets.chomp
	File.open("./maps/#{filename}.json", "w") { |file|  file.write(map_data)}
	puts "Map saved at maps/#{filename}"
elsif input == "no"
	puts "Bye!"
else
	puts "type 'yes' or 'no'"
end

puts "Bye!"
		