hash = {"item" => "bread", "quantity" => 3, "company" => "MacaBread"}
new_hash = {"item" => "corn", "quantity" => 6, "company" => "FeedStalk"}

puts "Hash: #{hash}"
sleep 1
puts "Hash length: #{hash.length}"
sleep 1
puts "Hash keys: #{hash.keys}"
sleep 1
puts "Hash values: #{hash.values}"
sleep 1
puts "Hash (invert): #{hash.invert}"
sleep 1
print "Hash (shift): "
puts  hash.shift.inspect
puts "Hash: #{hash.inspect}"

hash["item"] = "bread"

puts "Hash: #{hash.inspect}"
sleep 1
puts "Hashes merging.."
sleep 1
puts "Merged hash: #{hash.merge("calories" => 108)} "