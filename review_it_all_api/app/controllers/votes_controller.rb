class VotesController < ApplicationController
    def create
        p params
        vote = Vote.new(vote_params)
        if vote.save
            render json: vote
        end
    end

    def update
        vote = Vote.find(params[:id])
        if vote.update(vote_params)
            render json: vote
        end
    end

    private
    
    def vote_params
        params.require(:vote).permit(:review_id, :user_id, :sentiment)
    end
end