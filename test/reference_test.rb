require "test_helper"

class ReferenceTest < BaseTest
  def test_just_include_no_call
    s = ThirdSequencedModel.create(auto_increment: 1)
    assert_equal s.auto_increment, 1
  end

  def test_next_sequence
    assert_equal ThirdSequencedModel.next_sequence('test_field'), 1
    assert_equal ThirdSequencedModel.next_sequence('test_field'), 2
  end
end
