class ReviewsController < ApplicationController

    def index
        reviews = Review.all
        render json: reviews
    end

    def create
        review = Review.new(review_params)
        if review.save
            render json: review
        end
    end

    def destroy
        review = Review.find(params[:id])
        review.destroy
    end

    private
    
    def review_params
        params.require(:review).permit(:content, :user_id, :subject_id, :score)
    end
end