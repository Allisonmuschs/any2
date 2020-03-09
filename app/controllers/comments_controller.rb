class CommentsController < ApplicationController
  def create
    find_commentable
    @comment = @commentable.comments.new comment_params
    @comment.url = parse_youtube(params[:comment][:url])
    @comment.user = current_user
    if @comment.save
      redirect_back fallback_location: root_path
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirection(@comment)
    else
      render :edit
    end
  end


  def search
    ::YoutubeSearch.new.call('hello')
  end

  def like
    @comment = Comment.find(params[:id])
    if !current_user.liked? @comment
      @comment.liked_by current_user
    elsif current_user.liked? @comment
      # as the above method can also result nil if he is yet to vote
      @comment.unliked_by current_user
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirection(@comment)
    else
      render :edit
    end
  end

  private


  def parse_youtube url
     regex = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
     url.match(regex)[1]
  end

    def comment_params
    params.require(:comment).permit(:input, :url)
    end

    def find_commentable
        if params[:song_request_id]
        @commentable = SongRequest.find(params[:song_request_id])
      else params[:comment_id]
        @commentable = Comment.find(params[:comment_id])
      end
    end

    def redirection(comment)
      if comment.commentable_type.eql? 'SongRequest'
        redirect_to event_path(comment.commentable.event)
      else
        redirection(comment.commentable)
      end
    end
end
