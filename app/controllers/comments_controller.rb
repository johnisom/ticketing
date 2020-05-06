class CommentsController < ApplicationController
  before_action :set_comment, except: :create
  before_action :require_user
  before_action :require_same_user
  
  # POST /tickets/:ticket_id/comments
  def create
  end

  # GET /tickets/:ticket_id/comments/:comment_id/edit
  def edit
  end

  # PATCH/PUT /tickets/:ticket_id/comments/:comment_id
  def update
  end

  # DELETE /tickets/:ticket_id/comments/:comment_id
  def destroy
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def require_same_user
    # TODO
  end
end
