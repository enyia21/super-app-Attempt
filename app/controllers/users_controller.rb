class UsersController < ApplicationController
    before_action :get_user
    def index
        users = User.all
        render json: users
    end

    def create 
        user = User.new(strong_params)
        if user.save 
            render json: user, status: :created
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: @user, include: [:teams, :superheros]
    end

    def update
        @user.update(strong_params)
        if @user.save
            render json: @user, include: [:teams, :superheros], status: :created
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @user.destroy
    end

    private 
    def get_user
        @user = User.find_by(id: params[:id])
    end

    def strong_params
        params.require(
            :user).permit(
            :first_name, 
            :last_name, 
            :email, 
            :age)
    end
end
