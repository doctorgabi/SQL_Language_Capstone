require_relative 'helper'
require_relative '../models/category'

class TestCategories < JstudyTest
 def test_categories_are_created
  foos_before = database.execute("select count(id) from categories")[0][0]
  Category.create(name: "Foo")
  foos_after = database.execute("select count(id) from categories")[0][0]
  assert_equal foos_before + 1, foos_after
 end

 def test_create_creates_an_id
  category = Category.create(name: "Foo")
  refute_nil category.id, "Category id shouldn't be nil"
 end

 def test_all_returns_all_categories_in_alphabetical_order
  Category.create(name: "foo")
  Category.create(name: "bar")
  expected = ["bar", "foo"]
  actual = Category.all.map{ |category| category.name }
  assert_equal expected, actual
 end

 def test_all_returns_empty_array_if_no_categories
  results = Category.all
  assert_equal [], results
 end
end