require_relative 'app'

def main
  app = App.new
  options = ['List all books', 'List labels', 'List all music albums',
             'List all genres', 'List Games', 'Add a book', 'Add a music album',
             'Add a Game', 'Save Games to File [type -> games.json]', 'Quit']
  puts "Welcome to My Catalog."

  loop do
    puts "\n"
    puts "Options:"
    options.each_with_index do |option, index|
      puts "#{index + 1} - #{option}"
    end
    print 'Please choose an option [1-10]: '
    user_choice = gets.chomp.to_i
    puts "\n"
    app.operator(user_choice)
  end
end

main
