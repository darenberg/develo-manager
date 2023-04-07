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
    @project.owner = current_user
    floor = Floor.create(number: 0, project: @project)
    create_plans(floor)
    if @project.save!
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/edit_project")
    else
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/edit_project")
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'project was successfully destroyed.'
  end

  private

  def create_plans(floor)
    Plan::STAGES.each do |stage|
      Plan.create(
        stage: stage,
        floor: floor
      )
    end
  end

  def render_index
    if params[:edit].present? && params[:task_id].present?
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/tasks_edit_component", locals: { task: Task.find(params[:task_id])})
    elsif params[:task_id].present?
      @task = Task.find(params[:task_id])
      add_recommendation_to_user_task if params[:recommendation].present?
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/tasks_show_component", locals: { task: @task})
    elsif params[:create].present?
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/tasks_new_component")
    elsif params[:edit_project].present?
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/edit_project")
    elsif params[:tag_name].present?
      @tasks = @project.tasks.includes(:tags).where(tags: {tag_name: params[:tag_name]})
      @tags = true
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/show_components/tasks_component")
    elsif params[:dot_id].present?
      @dot = Dot.find(params[:dot_id])
      @tasks = @dot.tasks
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/show_components/tasks_component")
    else
      render :show, status: :ok, location: @project
    end
  end

  def add_recommendation_to_user_task
    recommendation = gpt3_service.content_recommendation(@task)
    user_task = current_user.user_task(@task)
    user_task.update(recommendation: recommendation)
  end

  def gpt3_service
    client = OpenAI::Client.new
    @gpt3_service ||= Gpt3Service.new(client)
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
