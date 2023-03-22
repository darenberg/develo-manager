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
    @task.update(task_params)
  end

  private

  def task_params
    params.require(:task).permit(:content, :tags, :title)
  end
end
