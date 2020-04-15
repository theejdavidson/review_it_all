class SubjectsController < ApplicationController
    
    def index
        subjects = Subject.all
        render json: subjects
    end

    def show
        subject = Subject.find(params[:id])
        render json: subject
    end

end