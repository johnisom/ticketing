class TagsController < ApplicationController
  before_action :set_tag, only: [:edit, :update, :destroy]

  # GET /tags
  def index
    @tags = Tag.all
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:success] = 'Tag was successfully created.'
      redirect_to Tag
    else
      render :new
    end
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      flash[:success] = 'Tag was successfully updated.'
      redirect_to @tag
    else
      render :edit
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
    flash[:success] = 'Tag was successfully destroyed.'
    redirect_to tags_url
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
