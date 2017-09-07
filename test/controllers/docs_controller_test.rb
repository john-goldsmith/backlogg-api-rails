require 'test_helper'

class DocsControllerTest < ActionDispatch::IntegrationTest

  test 'index' do
    get v1_docs_url
    assert_response :success
  end
end
