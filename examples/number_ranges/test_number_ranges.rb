# frozen_string_literal: true

require "minitest/autorun"
require_relative "number_ranges"

class NumberRangesTest < Minitest::Test
  def test_empty_input
    assert_empty NumberRanges.runs([])
    assert_equal "", NumberRanges.format([])
  end

  def test_unsorted_values_and_duplicates
    assert_equal [1..3, 5..5, 8..9], NumberRanges.runs([5, 9, 2, 1, 3, 8, 2])
  end

  def test_singleton_has_no_range_separator
    assert_equal "7", NumberRanges.format([7, 7])
  end

  def test_adjacent_negative_and_positive_values
    assert_equal "-3..1, 4", NumberRanges.format([4, -1, -3, 0, -2, 1])
  end

  def test_gap_of_one_missing_integer_starts_another_run
    assert_equal [1..2, 4..5], NumberRanges.runs([1, 2, 4, 5])
  end

  def test_input_order_is_preserved
    values = [3, 1, 2].freeze
    assert_equal "1..3", NumberRanges.format(values)
    assert_equal [3, 1, 2], values
  end

  def test_non_integer_is_rejected
    assert_raises(ArgumentError) { NumberRanges.runs([1, "2"]) }
    assert_raises(ArgumentError) { NumberRanges.format([2.0]) }
  end
end
