# See https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one
# See http://sourcey.com/building-the-prefect-rails-5-api-only-app/

class HealthCheckController < ApplicationController

  # include V1::Concerns::Docs::HealthCheckController
  include V1::Concerns::RespondWith # TODO: This is gross

  #
  # GET /health-check
  #
  # @return [type] [description]
  def index
    json = {
      data: nil
    }
    respond_with json
  end

end