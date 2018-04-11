class Book
  attr_reader :book_details

  def initialize(attributes)
    @book_details = attributes
  end

  def author_first_name
    book_details[:author_first_name]
  end

  def author_last_name
    book_details[:author_last_name]
  end

  def title
    book_details[:title]
  end

  def publication_date
    book_details[:publication_date][-4..-1]
  end
end
