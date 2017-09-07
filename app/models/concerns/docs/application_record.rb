
# module Concerns

  module Docs

    module ApplicationRecord

      extend ActiveSupport::Concern

      included do

        include Swagger::Blocks

      end

    end

  end

# end