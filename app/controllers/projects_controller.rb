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
    # unless params[:project_users].empty?
    #   params[:project_users].each do |user_id|
    #     ProjectUser.new(user_id: user_id, project: @project)
    #   end
    # end
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
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/tasks_show_component", locals: { task: Task.find(params[:task_id])})
    elsif params[:create].present?
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/tasks_new_component")
    elsif params[:tag_name].present?
      @tasks = @project.tasks.includes(:tags).where(tags: {tag_name: params[:tag_name]}).uniq
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/show_components/tasks_component")
    elsif params[:dot_id].present?
      @dot = Dot.find(params[:dot_id])
      @tasks = @dot.tasks
      @recommendation = gpt3_service.content_recommendation(@project.tasks)
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/show_components/tasks_component")
    else
      render :show, status: :ok, location: @project
    end
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
