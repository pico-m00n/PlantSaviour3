class Public::BookmarksController < ApplicationController
    
    def create
        question = Question.find(params[:question_id])
        bookmark = current_end_user.bookmarks.new(question_id: question.id)
        bookmark.save
        redirect_to question_path(question)
        post = Post.find(params[:post_id])
        bookmark = current_end_user.bookmarks.new(post_id: post.id)
        bookmark.save
        redirect_to post_path(post)
    end
    
    def destroy
        question = Question.find(params[:question_id])
        bookmark = current_end_user.bookmarks.find_by(question_id: question.id)
        bookmark.destroy
        redirect_to question_path(question)
    end
    
    def index
        @question
    end
    
end
