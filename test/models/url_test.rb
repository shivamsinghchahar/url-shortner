require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  setup do
    @url = Url.new(original: "http://example.com", pinned: true)
    @url.shorten_url
    @url.save
  end

  test "should be valid" do
    assert @url.valid?
  end

  test "original url should be valid" do
    new_url = @url
    new_url.original = " " * 6
    assert_not new_url.valid?
    assert_equal ["can't be blank", "Valid URL required"], new_url.errors[:original]
  end

  test "original url should be unique" do
    new_url = Url.new(original: @url.original)
    assert_not new_url.valid?
    assert_equal ["has already been taken"], new_url.errors[:original]
  end

  test "slug should be valid" do
    new_url = @url
    new_url.slug = " " * 6
    assert_not new_url.valid?
    assert_equal ["can't be blank"], new_url.errors[:slug]
  end

  test "slug url should be unique" do
    new_url = Url.new(original: @url.original, slug: @url.slug)
    assert_not new_url.valid?
    assert_equal ["has already been taken"], new_url.errors[:slug]
  end

  test "pinned should be present" do
    new_url = Url.new(original: "http://bigbinary.com", pinned: nil)
    new_url.shorten_url
    error = assert_raises ActiveRecord::NotNullViolation do
      new_url.save
    end
  end

  test "pinned should be valid" do
    new_url = Url.new(original: "http://bigbinary.com", pinned: 3)
    new_url.shorten_url
    assert_not new_url.valid?
    assert_equal ["Invalid"], new_url.errors[:pinned]
  end 
end
