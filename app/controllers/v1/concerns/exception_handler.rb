# TODO: Turn this into a gem
# See https://blog.rebased.pl/2016/11/07/api-error-handling.html

module V1

  module Concerns

    module ExceptionHandler

      extend ActiveSupport::Concern

      included do

        rescue_from ActiveRecord::RecordNotFound do |exception|
          json = {
            errors: [
              id: exception.id.to_s,
              detail: exception.message,
              status: Rack::Utils::SYMBOL_TO_STATUS_CODE[:not_found],
              meta: {
                model: exception.model
                # class: exception.class.to_s
                # backtrace: exception.backtrace
              }
            ]
          }
          respond_with json, :not_found
        end

        # rescue_from ActionController::RoutingError do |exception|
        #   puts exception.inspect
        #   json = {
        #     errors: [
        #       detail: exception.message,
        #       status: Rack::Utils::SYMBOL_TO_STATUS_CODE[:bad_request],
        #       meta: {
        #         # param: exception.param
        #         # model: exception.model
        #         # backtrace: exception.backtrace
        #       }
        #     ]
        #   }
        #   respond_with json, :bad_request
        # end

        rescue_from ActionController::ParameterMissing do |exception|
          json = {
            errors: [
              detail: exception.message,
              status: Rack::Utils::SYMBOL_TO_STATUS_CODE[:bad_request],
              meta: {
                param: exception.param
                # class: exception.class.to_s
                # backtrace: exception.backtrace
              }
            ]
          }
          respond_with json, :bad_request
        end

        rescue_from ActiveRecord::RecordInvalid do |exception|
          # TODO: Look into exception.record.errors.messages
          json = {
            errors: [
              detail: exception.message,
              status: Rack::Utils::SYMBOL_TO_STATUS_CODE[:unprocessable_entity]
              # meta: {
                # model: exception.model
                # backtrace: exception.backtrace
              # }
            ]
          }
          respond_with json, :unprocessable_entity
        end

        # rescue_from ActiveModel::ForbiddenAttributesError do |exception|
        #   json = {
        #     errors: [
        #       id: exception.id.to_s,
        #       detail: exception.message,
        #       status: Rack::Utils::SYMBOL_TO_STATUS_CODE[:unprocessable_entity],
        #       meta: {
        #         model: exception.model
        #         # backtrace: exception.backtrace
        #       }
        #     ]
        #   }
        #   respond_with json, :unprocessable_entity
        # end

        # rescue_from ActiveRecord::InvalidForeignKey do |exception|
        #   json = {
        #     errors: [
        #       detail: exception.message,
        #       status: Rack::Utils::SYMBOL_TO_STATUS_CODE[:bad_request]
        #       # meta: {
        #         # model: exception.model
        #         # backtrace: exception.backtrace
        #       # }
        #     ]
        #   }
        #   respond_with json, :bad_request
        # end

      end

    end

  end

end