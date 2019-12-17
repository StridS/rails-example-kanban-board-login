require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "mariam authentication" do
    u = users(:one)
    assert User.find_by(username: u.username).authenticate("asecret")
  end
end
