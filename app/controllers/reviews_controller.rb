class ReviewsController < ApplicationController

    def index 
        render json: Review.all
    end

    def show
        review = Review.find(params[:id])
        render json: review
    end

    def create
        review = Review.create!(review_params)
        render json: review, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

    def update
        review = Review.find(params[:id])
        review.update!(review_params)
        render json: review, status: :ok
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

    def destroy
        review = Review.find(params[:id])
        review.destroy
        head :no_content
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {errors: invalid.record.errors}, status: :not_found
    end

    private

    def review_params
        params.permit(:review, :game_id, :user_id)
    end

end
