require "test_helper"

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "Faisal", email: "faisal@gmail.com")
  end

  test "chef should be valid" do
    assert @chef.valid?
  end

  test "chef name should be present" do
    @chef.chefname = ' '
    assert_not @chef.valid?
  end
  test "chef name should not be too long" do
    @chef.chefname = 'a' * 41
    assert_not @chef.valid?
  end

  test "chef name should not be too short" do
    @chef.chefname = 'aa'
    assert_not @chef.valid?
  end

  test "email must be present" do
    @chef.email = ' '
    assert_not @chef.valid?
  end

  test "email length should be within bounds" do
    @chef.email = 'a' * 101 + "example.com"
    assert_not @chef.valid?
  end

  test "email address should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end

  test "email validation should accept valid addresses" do
    valid_address = %w[user@ee.com R_TDD-@eee.hello.org user@example.com first.last@eem.au la+joe@monk.cm]
    valid_address.each do |va|
      @chef.email = va
      assert @chef.valid?, '#{va.inspect} should be valid'
    end
  end

  test "email validations should reject invalid addresses" do
    invalid_addresses = %w[user@examole,com user_at_at.org user@example.]
    invalid_addresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, '#{ia.inspect} should be invalid'
    end
  end
end
