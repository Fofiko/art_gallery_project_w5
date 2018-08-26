require("minitest/autorun")
require_relative("../artist.rb")
require_relative("../exhibit.rb")

class TestExhibit < MiniTest::Test

  def setup
    info = {
      "id" => 1,
      "title" => "exhibit1",
      "category" => "cat",
      "artist_id" => "1"
    }
    @exhibit = Exhibit.new(info)
  end

  def test_title()
    result = @exhibit.title()
    assert_equal("exhibit1", result)
  end

  def test_category()
    result = @exhibit.category()
    assert_equal("cat", result)
  end

  def test_artist_id()
    result = @exhibit.artist_id()
    assert_equal(1, result)
  end


end
