class Public::PostCommentsController < ApplicationController
    
    def create
        post = Post.find(params[:post_id])
        body = current_end_user.post_comments.new(post_comment_params)
        body.post_id = post.id
        body.save
        redirect_to post_path(post)
    end
    
    def destroy
        PostComment.find(params[:id]).destroy
        redirect_to post_path(params[:post_id])
    end
    
    private
    
    def post_comment_params
        params.require(:post_comment).permit(:body)
    end
    
end
