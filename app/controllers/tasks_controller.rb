class TasksController < ApplicationController

  def create
    @task = Task.new(task_params)
    @dot = Dot.find(params[:dot_id])
    @task.dot = @dot
    if @task.save
      create_tags if params[:task][:tag_names].present?
      @project = @task.dot.plan.floor.project
      @tasks = @dot.tasks
      render "projects/show", status: :ok, location: @project
    else
      redirect_to project_path(@project)
      flash[:alert] = "Something went wrong"
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      @project = @task.dot.plan.floor.project
      create_tags if params[:task][:tag_names].present?
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/tasks_show_component", locals: { task: @task })
    else
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/tasks_edit_component", locals: { task: @task})
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    render "projects/show", status: :ok, location: @project, notice: 'task was successfully destroyed.'
  end

  private

  def create_tags
    tags = params[:task][:tag_names]
    @task.tags.destroy_all
    split_tags = tags.split(", ")
    split_tags.each do |tag|
      new_tag = Tag.create(tag_name: tag)
      @task.tags << new_tag
    end
    @task.save
  end

  def task_params
    params.require(:task).permit(:content, :title, :photo, :dot, :done)
  end

  def set_project
  end
end
