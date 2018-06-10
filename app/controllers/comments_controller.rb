class CommentsController < ApplicationController
    before_action :set_blog

    def create
        @comment = @blog.comments.new(comments_params)
        @comment.user_id = current_user.id
        @comment.save
        redirect_to @blog
	end

	private
		def set_blog
			@blog = Blog.find(params[:blog_id])
		end

		def comments_params
			params.required(:comment).permit(:comment) 	   
		end
end
