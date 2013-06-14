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

  def test_next_sequence_with_step
    assert_equal ThirdSequencedModel.next_sequence('test_field', 2), 2
    assert_equal ThirdSequencedModel.next_sequence('test_field', 1), 3
  end

  # 'step' should only work with no auto_increment field
  def test_auto_increment_with_step
    s1 = FirstSequencedModel.create

    s = FirstSequencedModel.next_sequence('auto_increment', 3)
    s2 = FirstSequencedModel.create(auto_increment: s)
    assert_not_equal s2.auto_increment, 4
    assert_equal FirstSequencedModel.get_sequence('auto_increment'), 5
  end
end
