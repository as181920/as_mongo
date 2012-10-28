require "test/unit"
require File.join(File.dirname(__FILE__),"helper")
require "as_mongo"

class AsMongoTest< Test::Unit::TestCase
  def setup
    TestColl.remove
  end

  def teardown
  end

  def test_say_hi
    assert_equal "hi",AsMongo::Ttt.new.hi
  end

  def test_fetch_id
    _id = TestColl.insert(a: "a")
    assert_equal _id, TestColl.find_one["_id"]
    #when not exist
    assert_nil BSON::OrderedHash.new._id
  end

  def test_to_s
    _id = TestColl.insert(a: "a")
    assert_equal _id.to_s, TestColl.find_one.to_s
    #when _id not exist
    assert_equal "", BSON::OrderedHash.new.to_s
  end

  def test_created_at
    time = Time.now
    TestColl.insert(created_at: time)
    assert_equal time.to_s, TestColl.find_one.created_at.to_s
    TestColl.remove

    #invalid time format
    TestColl.insert(created_at: 0)
    assert_equal 0, TestColl.find_one.created_at
    TestColl.remove
    TestColl.insert(created_at: "abc")
    assert_equal "abc", TestColl.find_one.created_at
    TestColl.remove
    TestColl.insert(created_at: nil)
    assert_equal nil, TestColl.find_one.created_at

    #when created_at not exist
    _id = TestColl.insert(a: "a")
    assert_nil TestColl.find_one.created_at
  end

  def test_updated_and_deleted_at
    time = Time.now
    TestColl.insert(updated_at: time)
    assert_equal time.to_s, TestColl.find_one.updated_at.to_s
    TestColl.remove

    TestColl.insert(deleted_at: time)
    assert_equal time.to_s, TestColl.find_one.deleted_at.to_s
  end
end
