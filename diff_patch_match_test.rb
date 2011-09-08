require 'test/unit'
require_relative 'diff_patch_match'

class DiffTest < Test::Unit::TestCase
  def setup
    @dmp = DiffPatchMatch.new
  end

  def test_diff_commonPrefix
    # Detect any common prefix.
    # Null case.
    assert_equal(0, @dmp.diff_commonPrefix('abc', 'xyz'))

    # Non-null case.
    assert_equal(4, @dmp.diff_commonPrefix('1234abcdef', '1234xyz'))

    # Whole case.
    assert_equal(4, @dmp.diff_commonPrefix('1234', '1234xyz'))
  end

  def test_diff_commonSuffix
    # Detect any common suffix.
    # Null case.
    assert_equal(0, @dmp.diff_commonSuffix('abc', 'xyz'))

    # Non-null case.
    assert_equal(4, @dmp.diff_commonSuffix('abcdef1234', 'xyz1234'))

    # Whole case.
    assert_equal(4, @dmp.diff_commonSuffix('1234', 'xyz1234'))
  end

  def test_diff_commonOverlap
    # Detect any suffix/prefix overlap.
    # Null case.
    assert_equal(0, @dmp.diff_commonOverlap('', 'abcd'))

    # Whole case.
    assert_equal(3, @dmp.diff_commonOverlap('abc', 'abcd'))

    # No overlap.
    assert_equal(0, @dmp.diff_commonOverlap('123456', 'abcd'))

    # Overlap.
    assert_equal(3, @dmp.diff_commonOverlap('123456xxx', 'xxxabcd'))
  end

end
