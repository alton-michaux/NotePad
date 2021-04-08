# frozen_string_literal: true

def repeat(string, times)
  raise 'times must be 1 or more' if times < 1

  counter = 0
  loop do
    puts string
    counter += 1
    sleep 1
    break if counter == times
  end
end

puts repeat('cool', 17)
