class View

def ask_for(thing)
  puts "What is the #{thing}?"
  return gets.chomp
end

def list_all(books)
  if books.empty?
    puts "No entries"
  else
  books.each_with_index do |book, index|
    puts "#{index + 1} - TITLE: #{book.title} - AUTHOR: #{book.author} -
    TOTAL LENGTH: #{book.total_length} - READ LENGTH: #{book.read_length} -
    FINISHED DATE: #{book.finished_date}"
      end
    end
  end

def ask_for_edit
  puts "Edit notes? Y/N"
  return gets.chomp
end

end
