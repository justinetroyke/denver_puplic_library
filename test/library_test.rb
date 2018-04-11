require './test/test_helper'
require './lib/author'
require './lib/library'

class LibraryTest < Minitest::Test
  attr_reader :charlotte_bronte,
              :jane_eyre,
              :villette,
              :harper_lee,
              :mockingbird,
              :dpl

  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    # @villette  = charlotte_bronte.add_book("Villette", "1853")
    @harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    @dpl = Library.new
  end

  def test_class_exists
    assert_instance_of Library, dpl
  end

  def test_it_holds_books
    assert_equal [], dpl.books
  end

  def test_it_can_have_books_added
    dpl.add_to_collection(jane_eyre)

    assert_instance_of Array, dpl.books
    assert_equal 1, dpl.books.length
    assert_equal 'Jane Eyre', dpl.books[0].book_details[:title]
  end

  def test_it_can_have_multiple_books_added
    skip
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    result = dpl.books

    assert_equal 3, result.length
  end

  def test_if_collection_includes_book
    skip
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    assert dpl.include?("To Kill a Mockingbird")
  end
end
#
# ```ruby
# > dpl.include?("To Kill a Mockingbird")
# # => true
#
# > dpl.include?("A Connecticut Yankee in King Arthur's Court")
# # => false
#
# > dpl.card_catalogue
# # NOTE:this method returns an array of books in alphabetical order by author's last name
# # => [#<Book:0x007f98a9c6ace8 @author_last_name="Bronte"...>, #<Book:0x007fb410ea56e8 @author_last_name="Bronte"...>, #<Book:0x007fb410e8e1f0 @author_last_name="Lee"...> ]
# ```
