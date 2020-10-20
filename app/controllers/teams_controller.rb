class TeamsController < ApplicationController
    before_action :get_team, only: [:show, :edit, :destroy, :update]
    def index
        teams = Team.all
        render json: teams, include: [:user]
    end

    def create
        @team = Team.new(strong_params)
        if @team.save
            render json: @team, status: :created
        else
            render json: @team.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: @team, include: [:user, :superheros]
    end

    
    def update
        
        @team.update(strong_params)
        if @team.save
            render json: @team, status: :created
        else
            render json: @team.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @team.destroy
        render :json => {:status => "Success!"}
    end

    private 
    def get_team
        @team = Team.find_by(id: params[:id])
    end

    def strong_params
        params.require(:team).permit(
            :name,
            :user_id,
            :superhero_ids => [])
    end

    # def strong_params
    #     params.require(:team).permit(:name, )
    # end
end
