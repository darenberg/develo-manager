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

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to project_path, notice: 'task was successfully destroyed.'
  end

  private

  def task_params
    params.require(:task).permit(:content, :tags, :title)
  end

  def set_project
  end
end
