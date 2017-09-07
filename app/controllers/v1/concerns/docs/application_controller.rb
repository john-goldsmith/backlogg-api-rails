module V1

  module Concerns

    module Docs

      module ApplicationController

        extend ActiveSupport::Concern

        included do

          include Swagger::Blocks

        end

      end

    end

  end

end