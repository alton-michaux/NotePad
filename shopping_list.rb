#list creation method
def create_list
    #get user input and remove extra character, store in variable "name"
    print "what is the list name? "
    name = gets.chomp
    #create hash with title value and return hash
    hash = {"name" => name, "items" => Array.new}
    return hash
end
#item addition method
def add_list_item
    #get user input and remove extra character, store in variable "item_name"
    print "What is the item called? "
    item_name = gets.chomp
    #get quantity input from user and store in "quantity" variable
    print "How much would you like? "
    quantity = gets.chomp.to_i
    #update "items" array before appending to original hash
    hash = {"name" => item_name, "quantity" => quantity}
    return hash
end
#method to print seperator lines
def print_seperator(character="-")
    puts character * 80
end
#method that prints comprehensive list of items and quantities
def print_list(list)
    puts "List: #{list['name']}"
    print_seperator()
    #format list output
    list['items'].each do |item|
        puts "\tItem: " + item['name'] + "\t\t\t" +
             "Quantity: " + item['quantity'].to_s
    end
    print_seperator()
end
#call original list creation method
list = create_list()

puts "Great! Add some items to your list!"
#add items and quantities to "items" array, which later get appended to the hash
list["items"].push(add_list_item)
list["items"].push(add_list_item)
list["items"].push(add_list_item)
#return final hash
puts "Here's your list: \n"
print_list(list)