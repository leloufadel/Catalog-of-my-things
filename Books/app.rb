require_relative 'book'
require 'json'

class App 
  def initialize  
    @books = []
    @labels = []
  end

  def list_all_books
    if @books.empty?
      puts "No books available"
    else
      puts "List of Books:"
      @books.each_with_index do |book, index| 
        label_title = book.label ? book.label.title : 'N/A' 
        puts "#{index + 1}. Publisher: #{book.publisher}, Cover State: #{book.cover_state},
        Publish Date: #{book.publish_date}, Label: #{label_title}" 
      end
    end
  end

  def add_book
    publish_date = input_publish_date
    publisher = input_publisher
    cover_state = input_cover_state
    book = Book.new(publisher, cover_state, publish_date)
    @books << book
    # label = add_label(book)
    # book.add_label(label)
    puts 'Book added successfully'
    puts 'Press Enter to continue!'
    gets.chomp
  end

  def input_publish_date
    puts 'Kindly Enter publish date in the following format: yyyy/mm/dd'
    gets.chomp
  end

  def input_publisher
    puts 'Please enter the Publisher'
    gets.chomp
  end 

  def input_cover_state
    puts 'Please enter the cover state'
    gets.chomp
  end 

#   def add_label(book)
#     puts 'Enter Label title'
#     title = gets.chomp
#     puts 'Enter Label Color'
#     color = gets.chomp
#     label = Label.new(title, color)
#     @labels << label
#     label
#   end

  def run
    loop do
      puts "Options:"
      puts "1. List all books"
      puts "2. Add a book"
      puts "3. Quit"
      print "Choose an option: "
      choice = gets.chomp.to_i

      case choice
      when 1
        list_all_books
      when 2
        add_book
      when 3
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end

  private

  def save_books_to_json
    begin
      File.open('data_preserved/books.json', 'w') do |file|
        file.write(JSON.pretty_generate(@books.map(&:to_hash)))
      end
      puts 'Books saved to JSON successfully.'
    rescue => e
      puts "Error saving books to JSON: #{e.message}"
    end
  end
  
  
end
