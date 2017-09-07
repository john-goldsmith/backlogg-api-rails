# See https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one
# See http://sourcey.com/building-the-prefect-rails-5-api-only-app/

module V1

  class ApiController < ApplicationController

    include V1::Concerns::RespondWith
    include V1::Concerns::ExceptionHandler
    include V1::Concerns::Docs::ApiController

  end

end