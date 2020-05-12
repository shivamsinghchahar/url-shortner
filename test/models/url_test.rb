require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  setup do
    @url = Url.new(original_url: "http://example.com")
    @url.shorten_url
    @url.save
  end

  test "should be valid" do
    assert @url.valid?
  end

  test "original url should be valid" do
    new_url = @url
    new_url.original_url = " " * 6
    assert_not new_url.valid?
    assert_equal ["can't be blank", "Valid URL required"], new_url.errors[:original_url]
  end

  test "original url should be unique" do
    new_url = Url.new(original_url: @url.original_url)
    assert_not new_url.valid?
    assert_equal ["has already been taken"], new_url.errors[:original_url]
  end

  test "slug should be valid" do
    new_url = @url
<<<<<<< HEAD
    new_url.slug = " " * 6
    assert_not new_url.valid?
    assert_equal ["can't be blank"], new_url.errors[:slug]
  end

  test "slug url should be unique" do
    new_url = Url.new(original_url: @url.original_url, slug: @url.slug)
    assert_not new_url.valid?
    assert_equal ["has already been taken"], new_url.errors[:slug]
=======
    new_url.shortened_url = " " * 6
    assert_not new_url.valid?
    assert_equal ["can't be blank", "Valid URL required"], new_url.errors[:shortened_url]
  end

  test "shortened url should be unique" do
    new_url = Url.new(original_url: @url.original_url, shortened_url: @url.shortened_url)
    assert_not new_url.valid?
    assert_equal ["has already been taken"], new_url.errors[:shortened_url]
>>>>>>> ac5ca7a... Fixed typo
  end
end
