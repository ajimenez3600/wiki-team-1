class UsersController < ApplicationController
    include VerificationConcern
    before_action :set_user, only: [:show]
    before_action :confirm_admin

    # GET /users
    def index
        @users = User.all
    end

    # GET/users/:id
    def show
    end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
