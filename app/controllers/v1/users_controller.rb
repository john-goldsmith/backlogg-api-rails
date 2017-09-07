# See https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one
# See http://sourcey.com/building-the-prefect-rails-5-api-only-app/

module V1

  class UsersController < ApiController

    include V1::Concerns::Docs::UsersController

    before_action :set_user, only: [:show, :update, :destroy]

    #
    # GET /
    #
    # @return [type] [description]
    def index
      respond_with User.all
    end

    #
    # POST /
    #
    # @return [type] [description]
    def create
      @user = User.create! user_params
      respond_with @user, :created
    end

    #
    # GET /:id
    #
    # @return [type] [description]
    def show
      respond_with @user
    end

    #
    # PUT /:id
    #
    # @return [type] [description]
    def update
      @user.update user_params
      respond_with @user
    end

    #
    # DELETE /:id
    #
    # @return [type] [description]
    def destroy
      @user.destroy
      respond_with '', :no_content
    end

    #
    # POST /authenticate
    #
    # @return [type] [description]
    def authenticate
      user = User.find_by_email! authentication_email_param
      if user && user.authenticate(authentication_password_param)
        respond_with user
      else
        raise ActiveRecord::RecordNotFound.new("Couldn't authenticate User") # see V1::Concerns::ExceptionHandler
      end
    end

    private

    #
    # [user_params description]
    #
    # @return [type] [description]
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :birthday)
    end

    #
    # [authentication_params description]
    #
    # @return [type] [description]
    def authentication_email_param
      params.require(:user).require(:email)
    end

    def authentication_password_param
      params.require(:user).require(:password)
    end

    #
    # [set_user description]
    #
    # @return [type] [description]
    def set_user
      @user = User.find params[:id]
    end

  end

end