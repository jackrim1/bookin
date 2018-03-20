require 'test_helper'

class MessTest < ActiveSupport::TestCase
  test "Mess has a name" do
    test_mess = Mess.new
    assert_not test_mess.save, "Saved the Mess without a name"
  end
end
