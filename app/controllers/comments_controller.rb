class CommentsController < ApplicationController
  before_action :set_comment, except: :create
  before_action :require_user
  before_action :require_same_user
  
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

  # DELETE /tickets/:ticket_id/comments/:comment_id
  def destroy
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
    # TODO
  end
end
