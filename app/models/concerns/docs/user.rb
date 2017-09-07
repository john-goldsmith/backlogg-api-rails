# module Concerns

  module Docs

    module User

      extend ActiveSupport::Concern

      included do

        include Swagger::Blocks

        swagger_schema :User do
          key :required, [:email]
          property :first_name do
            key :type, :string
          end
          property :last_name do
            key :type, :string
          end
          property :birthday do
            key :type, :string
          end
          property :email do
            key :type, :string
          end
          property :created_at do
            key :type, :string
          end
          property :updated_at do
            key :type, :string
          end
        end

        swagger_schema :CreateOrModifyUserParameters do
          key :required, [:user]
          property :user do
            key :type, :object
            property :first_name do
              key :type, :string
            end
            property :last_name do
              key :type, :string
            end
            property :birthday do
              key :type, :string
            end
            property :email do
              key :type, :string
            end
          end
        end

        swagger_schema :AuthenticateUserParameters do
          key :required, [:user]
          property :user do
            key :type, :object
            key :required, [:email, :password]
            property :email do
              key :type, :string
            end
            property :password do
              key :type, :string
            end
          end
        end

        swagger_schema :JsonApiDataObject do
          property :data do
            key :type, :object
            property :attributes do
              key :type, :object
              key :'$ref', :User
            end
            property :id do
              key :type, :string
            end
            property :type do
              key :type, :string
            end
          end
        end

        swagger_schema :JsonApiDataArray do
          property :data do
            key :type, :array
            items do
              key :type, :object
              property :attributes do
                key :type, :object
                key :'$ref', :User
              end
              property :id do
                key :type, :string
              end
              property :type do
                key :type, :string
              end
            end
          end
        end

        swagger_schema :JsonApiErrorArray do
          property :errors do
            key :type, :array
            items do
              key :type, :object
              key :'$ref', :Error
            end
          end
        end

        swagger_schema :Error do
          property :detail do
            key :type, :string
          end
          property :id do
            key :type, :string
          end
          property :status do
            key :type, :integer
          end
          property :meta do
            key :type, :object
            property :model do
              key :type, :string
            end
          end
        end

      end

    end

  end

# end