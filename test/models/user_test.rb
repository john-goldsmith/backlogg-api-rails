require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  def setup
    @user = users(:john)
    @user.password = 'Abc123123!'
  end

  test 'valid user' do
    assert @user.valid?
    assert_empty @user.errors
  end

  test 'invalid without an email' do
    @user.email = nil
    refute @user.valid?, "User must have an email"
    refute_nil @user.errors[:email]
  end

  test 'invalid without a properly formatted email' do
    @user.email = 'john@backlogg'
    refute @user.valid?, "User must have a properly formatted email"
    refute_nil @user.errors[:email]
  end

  test 'invalid without a password' do
    @user.password = nil
    refute @user.valid?, "User must have a password"
    refute_nil @user.errors[:password]
  end
end