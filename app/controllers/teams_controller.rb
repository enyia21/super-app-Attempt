class TeamsController < ApplicationController
    before_action :get_team, only: [:show, :edit, :destroy]
    def index
        teams = Team.all
        render json: teams, include: [:user]
    end

    def create
        binding.pry
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

    def destroy
        binding.pry
        @team.destroy
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
