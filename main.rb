require_relative 'app'

def main
  app = App.new
  options = ['List all author', 'List all games', 'Add a game', 'Exit']

  loop do
    puts "\nWelcome to My Catalog."
    options.each_with_index do |option, index|
      puts "#{index + 1} - #{option}"
    end
    print 'Please choose an option [1-10] '
    user_choice = gets.chomp.to_i
    puts "\n"
    app.operator(user_choice)
  end
end

main
