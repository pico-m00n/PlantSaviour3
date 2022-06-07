class Public::PostsController < ApplicationController
    
    def new
        @tags = Tag.all
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.end_user_id = current_end_user.id
        if @post.save
            redirect_to posts_path
        else
            render :new
        end
    end
    
    def index
        @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.page(params[:page])
    end
    
    def show
        @post = Post.find(params[:id])
        @post_comment = PostComment.new
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to post_path
    end
    
    private
    
    def post_params
        params.require(:post).permit(:title, :body, :image, {:tag_ids => []})
    end
    
    
end
