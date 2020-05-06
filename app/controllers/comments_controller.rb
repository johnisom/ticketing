class CommentsController < ApplicationController
  before_action :set_comment, except: :create
  before_action :require_user
  before_action :require_same_user, except: :create
  
  # POST /tickets/:ticket_id/comments
  def create
    @comment = Comment.new(comment_params)
    @ticket = @comment.ticket

    if @comment.save
      flash[:success] = 'Comment successfully saved.'
      redirect_to @comment.ticket
    else
      render 'edit'
    end
  end

  # GET /tickets/:ticket_id/comments/:comment_id/edit
  def edit
    @ticket = @comment.ticket
  end

  # PATCH/PUT /tickets/:ticket_id/comments/:comment_id
  def update
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
      .merge({ ticket_id: params[:ticket_id], creator: current_user })
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def require_same_user
    unless current_user == @comment.creator
      flash[:notice] = 'You must be the creator to do that'
      redirect_back fallback_location: root_path
    end
  end
end
