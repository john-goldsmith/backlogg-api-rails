module V1

  module Concerns

    module Docs

      module ApiController

        extend ActiveSupport::Concern

        included do

          include Swagger::Blocks

        end

      end

    end

  end

end