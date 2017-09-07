module V1

  module Concerns

    module RespondWith

      extend ActiveSupport::Concern

      included do

        def respond_with payload = {}, status = :ok
          render json: payload, status: status
        end

      end

    end

  end

end