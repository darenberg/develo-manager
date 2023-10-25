class TasksController < ApplicationController

  def create
    @task = Task.new(task_params)
    @dot = Dot.find(params[:dot_id])
    @task.dot = @dot
    if @task.save
      # Handle the tags
      create_tags(params[:tags][:tag_names]) if params[:tags][:tag_names].present?
      # Handle user associations
      associate_users_to_task if params[:task][:user_ids].present?
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
    @project = @task.dot.plan.floor.project

    if @task.update(task_params)
      # Handle the tags
      create_tags(params[:task][:tag_names]) if params[:task][:tag_names].present?

      # Handle user associations
      associate_users_to_task if params[:task][:user_ids].present?

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

  def associate_users_to_task
    current_user_ids = @task.user_ids
    params[:task][:user_ids].each do |user_id|
      next if user_id.empty?

      unless current_user_ids.include?(user_id.to_i)
        @task.user_tasks.create(user_id: user_id)
      end
    end
  end

  def create_tags(tags)
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
