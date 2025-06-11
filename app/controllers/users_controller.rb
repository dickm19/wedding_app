class UsersController < ApplicationController
    # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
    allow_browser versions: :modern

    def index
        @users = User.all
        if @users
            render json: {
                users: @users
            }
        else
            render json: {
                status: 500,
                errors: [ "no users found" ]
            }
        end
    end

    def show
        @user = User.find(params[:id])
        if @user
            render json: {
                user: @user
            }
        else
            render json: {
                status: 500,
                errors: [ "user not found" ]
            }
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!
            render json: {
                status: :created,
                user: @user
            }
        else
            render json: {
                status: 500,
                errors: @user.errors.full_messages
            }
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        if authorized_user? && @user.save
            render json: {
                status: :ok,
                user: @user
            }
        else
            render json: {
                status: 403,
                errors: [ "not authorized to update this user" ]
            }
        end
    end


    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
    end
end
