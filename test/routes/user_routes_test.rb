require 'test_helper'

class UserRoutesTest < ActionDispatch::IntegrationTest
  def setup
    @version = 'v1'
  end

  test "index" do
    assert_routing({ method: 'get', path: "/#{@version}" }, { controller: "#{@version}/users", action: 'index' })
  end

  test "create" do
    assert_routing({ method: 'post', path: "/#{@version}" }, { controller: "#{@version}/users", action: 'create' })
  end

  test "show" do
    assert_routing({ method: 'get', path: "/#{@version}/123" }, { controller: "#{@version}/users", action: 'show', id: '123' })
  end

  test "update" do
    assert_routing({ method: 'put', path: "/#{@version}/123" }, { controller: "#{@version}/users", action: 'update', id: '123' })
  end

  test "destroy" do
    assert_routing({ method: 'delete', path: "/#{@version}/123" }, { controller: "#{@version}/users", action: 'destroy', id: '123' })
  end

  test "authenticate" do
    assert_routing({ method: 'post', path: "/#{@version}/authenticate" }, { controller: "#{@version}/users", action: 'authenticate' })
  end

  test "docs" do
    assert_routing({ method: 'get', path: "/#{@version}/docs" }, { controller: "#{@version}/docs", action: 'index' })
  end
end