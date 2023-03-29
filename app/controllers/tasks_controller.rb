class TasksController < ApplicationController

  def create
    @task = Task.new(task_params)
    @dot = Dot.find(params[:dot_id])
    @task.dot = @dot

    if @task.save!
      create_tags(params[:tags][:tags])
      @project = @task.dot.plan.floor.project
      render "projects/show", status: :ok, location: @project
    else
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/tasks_new_component", locals: { task: @task})
    end
  end

  def update
    @task = Task.find(params[:id])
    form_tags = params[:task][:tag_names]
    create_tags(form_tags)
    if @task.update(task_params)
      # create_tags(params[:tags][:tags])
      @project = @task.dot.plan.floor.project
      render "projects/show", status: :ok, location: @project
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

  def create_tags(tags)
    @task.tags.destroy_all
    split_tags = tags.split(", ")
    split_tags.each do |tag|
      Tag.create(tag_name: tag, task: @task)
    end
  end

  def task_params
    params.require(:task).permit(:content, :tags, :title, :photo, :dot, :done)
  end

  def set_project
  end
end
