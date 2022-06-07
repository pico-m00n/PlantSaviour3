class Public::SeachesController < ApplicationController
    
  def search
    @range = params[:range]
    if @range == "質問"
      @questions = Question.looks(params[:search], params[:word])
    else
      @posts = Post.looks(params[:search], params[:word])
    end
  end
  
end
