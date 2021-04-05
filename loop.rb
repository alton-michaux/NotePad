def repeat(string, times)
    fail "times must be 1 or more" if times < 1
    counter = 0
    loop do
      puts string
      counter += 1
      sleep 1
      if counter == times
        break
      end
    end
end

puts repeat("cool", 17)