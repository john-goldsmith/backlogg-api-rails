require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  fixtures :users

  def setup
    @version = 'v1'
    @user = users(:john)
    @user.password = 'Abc123123!'
    @serializer = V1::UserSerializer.new @user
    @serialization = ActiveModelSerializers::Adapter.create @serializer
    @user2 = users(:bob)
  end

  test 'index' do
    get v1_url
    assert_response :success
  end

  test 'create' do
    params = {
      user: {
        email: @user.email,
        password: @user.password
      }
    }
    assert_difference('User.count') do
      post v1_url, params: params
    end
    assert_response :success
    assert_equal @user.email, User.last.email
  end

  test 'create invalid record' do
    params = {
      user: {
        email: "invalid",
        password: @user.password
      }
    }
    post v1_url, params: params
    assert_response :unprocessable_entity
    expected = "{\"errors\":[{\"detail\":\"Validation failed: Email is not an email\",\"status\":422}]}" # TODO: use @response.parsed_body
    assert_equal expected, @response.body
  end

  test 'show' do
    get "/#{@version}/#{@user.id}" # TODO: Figure out why `v1_url, params: { id: 123 }` doesn't work
    assert_response :success
    assert_equal @serialization.to_json, @response.body
  end

  test 'show 404' do
    user_id = 123456789
    get "/#{@version}/#{user_id}" # TODO: Figure out why `v1_url, params: { id: 123 }` doesn't work
    assert_response :not_found
    expected = "{\"errors\":[{\"id\":\"#{user_id}\",\"detail\":\"Couldn't find User with 'id'=#{user_id}\",\"status\":404,\"meta\":{\"model\":\"User\"}}]}" # TODO: use @response.parsed_body
    assert_equal expected, @response.body
  end

  test 'update' do
    params = {
      user: {
        email: @user2.email
      }
    }
    put "/#{@version}/#{@user.id}", params: params # TODO: Figure out why `v1_url, params: { id: 123 }` doesn't work
    assert_response :success
    u = User.find(@user.id)
    assert_equal @user2.email, @response.parsed_body["data"]["attributes"]["email"]
  end

  test 'update param missing' do
    params = {
      user: {}
    }
    put "/#{@version}/#{@user.id}", params: params # TODO: Figure out why `v1_url, params: { id: 123 }` doesn't work
    assert_response :bad_request
    expected = "{\"errors\":[{\"detail\":\"param is missing or the value is empty: user\",\"status\":400,\"meta\":{\"param\":\"user\"}}]}" # TODO: use @response.parsed_body
    assert_equal expected, @response.body
  end

  test 'destroy' do
    assert_difference('User.count', -1) do
      delete "/#{@version}/#{@user.id}" # TODO: Figure out why `v1_url, params: { id: 123 }` doesn't work
    end
    assert_response :no_content
    refute_equal User.last, @user
  end

  test 'destroy 404' do
    user_id = 123456789
    assert_difference('User.count', 0) do
      delete "/#{@version}/#{user_id}" # TODO: Figure out why `v1_url, params: { id: 123 }` doesn't work
    end
    assert_response :not_found
  end

  test 'valid authentication credentials' do
    params = {
      user: {
        email: @user.email,
        password: @user.password
      }
    }
    post "/#{@version}/authenticate", params: params # TODO: Figure out why `v1_url, params: { id: 123 }` doesn't work
    assert_response :success
  end

  test 'invalid authentication email' do
    params = {
      user: {
        email: 'notfound',
        password: @user.password
      }
    }
    post "/#{@version}/authenticate", params: params # TODO: Figure out why `v1_url, params: { id: 123 }` doesn't work
    assert_response :not_found
  end

  test 'invalid authentication password' do
    params = {
      user: {
        email: @user.email,
        password: 'incorrect'
      }
    }
    post "/#{@version}/authenticate", params: params # TODO: Figure out why `v1_url, params: { id: 123 }` doesn't work
    assert_response :not_found
  end

  test 'docs' do
    get v1_docs_url
    assert_response :success
  end
end
