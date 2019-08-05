class Router
  def initialize
    @controller = Controller.new
  end

def run
  welcome_user
  loop do
    print_menu
    action = gets.chomp.to_i
    route_action(action)
  end
end

def route_action(action)
  case action
  when 1 then @controller.index
  when 2 then @controller.create
  when 3 then @controller.delete
  when 4 then @controller.update
  when 5 then @controller.search
  end
end

def actions
  [
    "Load reading list",
    "Add an entry",
    "Delete an entry",
    "Update an entry",
    "Search for a book",
    "Exit program"
  ]
end

def print_menu
  puts "\nChoose from below: \n "
  actions.each_with_index {|action, index|
    puts "#{index + 1} - #{action}"
  }
end


def welcome_user
  puts "-----------------"
  puts "\nWelcome to the Library"
  puts "독서파만권하필여유신"
  puts "\n-----------------"
end

end
