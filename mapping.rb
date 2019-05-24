require 'json'
journey_map = File.open("./map.json", "r") { |f| JSON.parse(f.read) }

payload = "<!DOCTYPE html>
<html>
<head>
	<title>Map</title>
	<link rel=\"stylesheet\" type=\"text/css\" href=\"div-map-stylesheet.css\">
</head>
<body>"

journey_map["journey"]["groups"].each do |group_name, group_values|
	payload << "<div class=\"group\">" 
	payload << "<div class=\"group-name\">" + group_name + "</div>"
	group_values["starts_at"].times do
		payload << "<div class=\"placeholder\"></div>"
	end
	group_values["steps"].each do |step|
		payload << "<div class=\"step\">" + step + "</div>"
	end
	payload << "</div>"
end

payload << "
</body>
</html>"


puts "payload: " + payload

File.open("./map.html", "w") { |f| f.write(payload) }
