class SubjectsController < ApplicationController
    
    def index
        subjects = Subject.all
        render json: subjects
    end

    def show
        subject = Subject.find(params[:id])
        render json: subject
    end

    def create
        p params
        subject = Subject.new(subject_params)
        if subject.save
            render json: subject
        end
    end

    private
    
    def subject_params
        params.require(:subject).permit(:description, :category, :name)
    end

end