require("minitest/autorun")
require_relative("../artist.rb")

class TestArtist < MiniTest::Test

  def setup
    info = {
      "id" => 1,
      "name" => "artist1"
    }
    @artist = Artist.new(info)
  end

  def test_name()
    result = @artist.name()
    assert_equal("artist1", result)
  end

  

end
