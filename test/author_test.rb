require './lib/book'
require './test/test_helper'

class AuthorTest < Minitest::Test
  attr_reader :charlotte_bronte

  def setup
    @charlotte_bronte = Author.new({
      first_name: 'Charlotte',
      last_name: 'Bronte' })
  end

  def test_class_exists
    assert_instance_of Author, charlotte_bronte
  end

  def test_it_has_books
    skip
    assert_equal [], charlotte_bronte.books
  end

  def test_it_adds_book_object
    skip
    added = charlotte_bronte.add_book('Jane Eyre', 'October 16, 1847')

    assert_instance_of Book, added
  end

  def test_it_holds_book
    skip
    charlotte_bronte.add_book('Jane Eyre', 'October 16, 1847')
    result = [
      @author_first_name = 'Charlotte',
      @author_last_name = 'Bronte',
      @publication_date = '1847',
      @title = 'Jane Eyre'
    ]

    assert_equal result, charlotte_bronte.books
  end

  def test_it_can_holds_two_books
    skip
    charlotte_bronte.add_book("Villette", "1853")
    result = []
  end
end
# ```ruby
# > require "./lib/author"
# # => true
#
# > charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
# # => #<Author:0x007fb410ada400>
#
# > charlotte_bronte.books
# # => []
#
# > charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
# # => #<Book:0x007f98a9c6ace8 @author_first_name="Charlotte", @author_last_name="Bronte", @publication_date="1847", @title="Jane Eyre">
#
# > charlotte_bronte.books
# # => [#<Book:0x007f98a9c6ace8 @author_first_name="Charlotte", @author_last_name="Bronte", @publication_date="10/16/1847", @title="Jane Eyre">]
#
# > charlotte_bronte.add_book("Villette", "1853")
# # => #<Book:0x007f98a9c6ace8 @author_first_name="Charlotte", @author_last_name="Bronte", @publication_date="1847", @title="Villette">
#
# > charlotte_bronte.books
# # => [#<Book:0x007f98a9c6ace8 @author_first_name="Charlotte", @author_last_name="Bronte", @publication_date="10/16/1847", @title="Jane Eyre">, #<Book:0x007f98a9c6add3 @author_first_name="Charlotte", @author_last_name="Bronte", @publication_date="1847", @title="Villette">]
# ```
