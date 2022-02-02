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

    def update
        game = Game.find(params[:id])
        game.update!(game_params)
        render json: game, status: :ok
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

    def destroy
        game = Game.find(params[:id])
        game.destroy
        head :no_content
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {errors: invalid.record.errors}, status: :not_found
    end

    private

    def game_params
        params.permit(:title, :genre, :description, :price)
    end

end
