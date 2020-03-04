class CommentsController < ApplicationController
  def create
    find_commentable
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    if @comment.save
      redirect_back fallback_location: root_path
    else
      render :new
    end
  end


  private

    def comment_params
    params.require(:comment).permit(:input)
    end

    def find_commentable
        if params[:song_request_id]
        @commentable = SongRequest.find(params[:song_request_id])
      else params[:comment_id]
        @commentable = Comment.find(params[:comment_id])
      end
    end
end
