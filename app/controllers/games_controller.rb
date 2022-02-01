class GamesController < ApplicationController

    def index 
        render json: Game.all
    end

    def show
        game = Game.find(params[:id])
        render json: game, include: :reviews
    end

    def create
        game = Game.create!(game_params)
        render json: game, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

    private

    def game_params
        params.permit(:title, :genre, :description, :price)
    end

end
