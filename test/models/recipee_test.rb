require "test_helper"

class RecipeeTest < ActiveSupport::TestCase

  def setup
    @recipee = Recipee.new(name: "Noodles Recipee", summary:"Spicy Noodles recipee is here", description:"First take one cup water put it on flame and add the noodle packet in it, now add the spices in your noodles and let it on fire for about 10 minutes, The spicy noodles is ready")
  end

  test "recipee should be valid" do
    assert @recipee.valid?
  end


  test "name should be present" do
    @recipee.name = " "
    assert_not @recipee.valid?
  end

  test "name length should not be too long" do
    @recipee.name = 'a' * 101
    assert_not @recipee.valid?
  end

  test "name length should not be too short" do
    @recipee.name = 'aaaa'
    assert_not @recipee.valid?
  end

  test "summary should be present" do
    @recipee.summary = " "
    assert_not @recipee.valid?
  end

  test "summary length should not be too long" do
    @recipee.summary = 'a' * 151
    assert_not @recipee.valid?
   end

  test "summary length should not be too short" do
    @recipee.summary = 'a' * 9
    assert_not @recipee.valid?
  end

  test "description should be preset" do
    @recipee.description = " "
    assert_not @recipee.valid?
  end

  test "descriptin should not be too long" do
    @recipee.description = 'a' * 501
    assert_not @recipee.valid?
  end

  test "description should not be too short" do
    @recipee.description = 'a' * 19
    assert_not  @recipee.valid?
  end

end
