require_relative 'book' 
require 'json'

class App 
    def 
      initialize  
      @book = []
      @label = []
    end

    def list_all_books
        if @books.empty?
            puts "No books available"
        else
            puts "List of Books:"
            @books.each_with_index do |book, index| 
            label_title = book.label ? book.label.title : 'N/A' 
  puts "#{index + 1}. Publisher: #{book.publisher}, Cover State: #{book.cover_state},
  Publish Date: #{book.publish_date}, Label: #{label_title} " 
        end
      end
    end
def add_book
    publish_date = input_publish_date
    publisher = input_publisher
    cover_state = input_cover_state
    book = Book.new(cover_state, publisher, publish_date)
    @books << book
    label = add_label(book)
    book.add_label(label)
    puts 'Book album Added Successfully'
    puts 'Press Enter to continue!'
    gets.chomp
end 

def input_publish_date
    puts 'Kindly Enter publish date in following format: yyyy/mm/dd'
    gets.chomp
  end
  def input_publisher
    puts 'please enter the Publisher'
    gets.chomp
  end 
def input_cover_state
    puts 'please enter the cover state'
    gets.chomp
end 

def add_label(book)
    puts 'Add a label'
    puts 'Enter Label Color'
    color = gets.chomp
    puts 'Enter Label title'
    title = gets.chomp
    label = Label.new(color, title, book.id)
    @label << label
    label
  end
end
