class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy ]

  def index
    @projects = Project.all
  end

  def show
    show_components
    render_index
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)


    unless params[:project_users].empty?
      params[:project_users].each do |user_id|
        ProjectUser.new(user_id: user_id, project: @project)
      end
    end

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
    unless params[:project_users].empty?
      params[:project_users].each do |user_id|
        ProjectUser.new(user_id: user_id, project: @project)
      end
    end
    redirect_to project_path(@project), notice: 'project was successfully updated.'
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'project was successfully destroyed.'
  end

  private

  def render_index
    if params[:edit].present? && params[:task_id].present?
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/tasks_edit_component", locals: { task: Task.find(params[:task_id])})
    elsif params[:task_id].present?
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/tasks_show_component", locals: { task: Task.find(params[:task_id])})
    elsif params[:create].present?
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/tasks_new_component")
    elsif params[:tag_name].present?
      puts "hola #{params[:tag_name]}"
      @tasks = @project.tasks.joins(:tags).where(tag: { tag_name: params[:tag_name] })
      respond_to do |format|
        format.html
        format.text { render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/show_components/task_component", locals: {project: @project, dots: @dots, tasks: @tasks, plans: @plans, floors: @floors }) }
      end
    else
      render :show, status: :ok, location: @project
    end
  end

  def show_components
    @dots = @project.dots
    @tasks = @project.tasks
    @plans = @project.plans
    @floors = @project.floors
  end

  def project_params
    params.require(:project).permit(:title)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
