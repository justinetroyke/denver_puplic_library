require './lib/author'

class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add_to_collection(book)
    collection = books << book
    collection.flatten
  end

  def include?(book_title)
    books.each do |book|
      if book.book_details[:title] == book_title
        true
      else false
      end
    end
  end
end
