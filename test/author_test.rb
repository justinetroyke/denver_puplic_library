require './lib/author'
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
    assert_equal [], charlotte_bronte.books
  end

  def test_it_adds_book_object
    added = charlotte_bronte.add_book('Jane Eyre', 'October 16, 1847')

    assert_instance_of Book, added[0]
  end

  def test_it_holds_book
    charlotte_bronte.add_book('Jane Eyre', 'October 16, 1847')

    assert_equal 1, charlotte_bronte.books.length
    assert_instance_of Book, charlotte_bronte.books[0]
    assert_equal 'Jane Eyre', charlotte_bronte.books[0].book_details[:title]
  end

  def test_it_can_holds_two_books
    charlotte_bronte.add_book('Jane Eyre', 'October 16, 1847')
    charlotte_bronte.add_book('Villette', '1853')
    called = charlotte_bronte.books

    assert_equal 2, called.length
    assert_equal ['Jane Eyre', 'Villette'], called.book_details[:title]
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
