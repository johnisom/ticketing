class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  before_action :require_user, except: %i[index show]

  # GET /
  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
    @tickets = @project.tickets
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:success] = 'Project was successfully created.'
      redirect_to @project
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      flash[:success] = 'Project was successfully updated.'
      redirect_to @project
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    flash[:success] =  'Project was successfully destroyed.'
    redirect_to projects_url
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
