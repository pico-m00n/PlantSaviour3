class Public::QuestionsController < ApplicationController
    
    def new
        @tags = Tag.all
        @question = Question.new
    end
    
    def create
        @question = Question.new(question_params)
        @question.end_user_id = current_end_user.id
        if @question.save
         redirect_to questions_path
        else
         render :new
        end
    end
    
    def index
        @questions = params[:tag_id].present? ? Tag.find(params[:tag_id]).questions : Question.page(params[:page])
    end
    
    def show
        @question = Question.find(params[:id])
        @answer = Answer.new
    end
    
    def destroy
        @question = Question.find(params[:id])
        @question.destroy
        redirect_to questions_path
    end
    
    private
    
    def question_params
        params.require(:question).permit(:title, :body, :image, {:tag_ids => []})
    end
end
