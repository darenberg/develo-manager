class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy ]

  def index
    @projects = Project.all
  end

  def show
    show_components
  end

  def new
    @project = project.new
  end

  def create
    @project = project.new(project_params)
    if @project.save!
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    @project.update(project_params)
    redirect_to project_path(@project), notice: 'project was successfully updated.'
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'project was successfully destroyed.'
  end

  private

  def show_components
    @tasks = @project.tasks
    @plans = @project.plans
    @floors = @project.floors
  end

  def project_params
    params.require(:project).permit(:title)
  end

  def set_project
    @project = project.find(params[:id])
  end
end
