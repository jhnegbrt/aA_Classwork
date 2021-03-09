class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      if @comment.parent_comment_id == nil
        redirect_to post_url(@comment.post_id) 
      else
        redirect_to :show
      end
    else
      flash[:errors]
    end
  end
# for every comment: there is a form for creating nested comments
# for every comment: the show page or partial page will include the comment itself, 
#   and also its child comments
# redirect to the post
# - comment 1 button -> reply to comment 1 -> new -> pass comment 1's id
#   - comment 2
#     - comment 3

  def show
    @comment = Comment.find_by(id: params[:id])

    while @comment.parent
      @comment = @comment.parent
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :parent_comment_id)
  end
end

