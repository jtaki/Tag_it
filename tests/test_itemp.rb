require "./lib/item_parser.rb"
require "test/unit"

class TestItemParser < Test::Unit::TestCase

  def gets_custom_name
    assert_equal(find_custom(1,self.num).class))
  end


end
