require 'test_helper'

class AnimalTest < ActiveSupport::TestCase

  def test_stuff
    assert_equal 0, Animal.count
  end
end
