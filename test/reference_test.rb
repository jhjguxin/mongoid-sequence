require "test_helper"

class ReferenceTest < BaseTest
  def test_just_include_no_call
    s = ThirdSequencedModel.create(auto_increment: 1)
    assert_equal s.auto_increment, 1
  end
end
