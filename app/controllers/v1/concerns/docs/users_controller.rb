module V1

  module Concerns

    module Docs

      module UsersController

        extend ActiveSupport::Concern

        included do

          include Swagger::Blocks

          swagger_path '/' do

            operation :get do
              key :summary, 'Get all users'
              key :description, 'Get all users'
              key :operationId, 'getAllUsers'
              key :produces, [
                'application/vnd.api+json'
              ]
              key :tags, [
                'user'
              ]
              response 200 do
                key :description, 'OK'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiDataArray
                end
              end
            end

            operation :post do
              key :summary, 'Create a new user'
              key :description, 'Creates a new user and returns the newly created user'
              key :operationId, 'createUser'
              key :tags, [
                'user'
              ]
              parameter do
                key :name, :user
                key :in, :body
                key :description, 'User'
                key :required, true
                schema do
                  key :'$ref', :CreateOrModifyUserParameters
                end
              end
              response 200 do
                key :description, 'OK'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiDataObject
                end
              end
              response 422 do
                key :description, 'Unprocessable entity'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiErrorArray
                end
              end
            end

          end

          swagger_path '/{id}' do

            operation :get do
              key :summary, 'Get a specific user'
              key :description, 'Get a specific user'
              key :operationId, 'getUser'
              key :tags, [
                'user'
              ]
              parameter do
                key :name, :id
                key :in, :path
                key :description, 'ID of user to fetch'
                key :required, true
                key :type, :integer
                key :format, :int64
              end
              response 200 do
                key :description, 'OK'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiDataObject
                end
              end
              response 404 do
                key :description, 'Not found'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiErrorArray
                end
              end
            end

            operation :put do
              key :summary, 'Update a specific user'
              key :description, 'Update a specific user'
              key :operationId, 'updateUser'
              key :tags, [
                'user'
              ]
              parameter do
                key :name, :user
                key :in, :body
                key :description, 'User'
                key :required, true
                schema do
                  key :'$ref', :CreateOrModifyUserParameters
                end
              end
              response 200 do
                key :description, 'OK'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiDataObject
                end
              end
              response 400 do
                key :description, 'Bad request'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiErrorArray
                end
              end
            end

            operation :delete do
              key :summary, 'Delete a specific user'
              key :description, 'Delete a specific user'
              key :operationId, 'deleteUser'
              key :tags, [
                'user'
              ]
              parameter do
                key :name, :id
                key :in, :path
                key :description, 'ID of user to delete'
                key :required, true
                key :type, :integer
                key :format, :int64
              end
              response 204 do
                key :description, 'No content'
              end
              response 404 do
                key :description, 'Not found'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiErrorArray
                end
              end
            end

          end

          swagger_path '/authenticate' do

            operation :post do
              key :summary, 'Authenticate a user'
              key :description, 'Authenticate and return the user'
              key :operationId, 'authenticateUser'
              key :tags, [
                'user'
              ]
              parameter do
                key :name, :user
                key :in, :body
                key :description, 'User authentication request body'
                key :required, true
                schema do
                  key :'$ref', :AuthenticateUserParameters
                end
              end
              response 200 do
                key :description, 'OK'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiDataObject
                end
              end
              response 400 do
                key :description, 'Bad request'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiErrorArray
                end
              end
              response 404 do
                key :description, 'Not found'
                schema do
                  key :type, :object
                  key :'$ref', :JsonApiErrorArray
                end
              end
            end

          end

        end

      end

    end

  end

end