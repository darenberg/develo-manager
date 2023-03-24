class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    @dot = Dot.find(params[:dot_id])
    @task.dot = @dot

    if @task.save!
      redirect_to @dot.plan.floor.project
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
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

  def task_params
    params.require(:task).permit(:content, :tags, :title, :photo, :dot)
  end

  def set_project
  end
end
