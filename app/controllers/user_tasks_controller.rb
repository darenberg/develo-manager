class UserTasksController < ApplicationController

  def create
    @user_task = UserTask.new(user_task_params)
    @project = @user_task.task.dot.plan.floor.project
    if @user_task.save
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/tasks_show_component", locals: { task: @user_task.task })
    else
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/tasks_edit_component", locals: { task: @user_task.task })
    end
  end

  def destroy
    @user_task = UserTask.find(params[:id])
    @user_task.destroy
    @project = @user_task.task.dot.plan.floor.project
    render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/tasks_show_component", locals: { task: @user_task.task })
  end

  private

  def user_task_params
    params.require(:user_task).permit(:task_id, :user_id)
  end
end
