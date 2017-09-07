module V1

  class UserSerializer < ApiSerializer

    attributes :id,
               :email,
               :first_name,
               :last_name,
               :birthday,
               :created_at,
               :updated_at

  end

end