class V1::UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @user.save

            render json: {
                "message": "User created"
            },
            status: :ok
        else

            render json: {
                "message": "Error",
                "error": @user.errors.full_messages
            },
            status: :bad_request
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: {
                "message": "User details updated"
            },
            status: :ok
        else

            render json: {
                "message": "Error",
                "errors": @user.errors.full_messages
            },
            status: :bad_request
        end
    end


    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            render json: {
                "message": "User details deleted"
            },
            status: :ok
        else

            render json: {
                "message": "Error",
                "errors": @user.errors.full_messages
            },
            status: :bad_request
        end
    end


    private

    def user_params
        params.permit(:full_name, :email, :password)
    end
end
