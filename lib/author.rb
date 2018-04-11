require './lib/book'

class Author
  attr_reader :author_details,
              :books

  def initialize(attributes)
    @author_details = attributes
    @books = []
  end

  def add_book(title, publication_date)
    new_book_deatils = {
      author_first_name: author_details[:first_name],
      author_last_name: author_details[:last_name],
      title: title,
      publication_date: publication_date
    }
    books << Book.new(new_book_deatils)
  end
end
