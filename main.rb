require_relative 'app'

def main
  puts 'Welcome to My-Catalog.'
  app = App.new
  app.run
end

main