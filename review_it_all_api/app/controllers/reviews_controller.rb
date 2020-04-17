class ReviewsController < ApplicationController

    def index
        reviews = Review.all
        render json: reviews
    end

    def create
        p params
        review = Review.new(review_params)
        if review.save
            render json: review
        end
    end

    private
    
    def review_params
        params.require(:review).permit(:content, :user_id, :subject_id, :score)
    end
end