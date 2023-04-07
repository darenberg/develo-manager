class ProjectUsersController < ApplicationController
  def create
    @project_user = ProjectUser.new(project_user_params)
    @project = @project_user.project
    if @project_user.save
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/edit_project")
    else
      render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/edit_project")
    end
  end

  def destroy
    @project_user = ProjectUser.find(params[:id])
    @project_user.destroy
    @project = @project_user.project
    render turbo_stream: turbo_stream.update("tasks_show", partial: "projects/turbo_frames/edit_project")
  end

  private

  def project_user_params
    params.require(:project_user).permit(:project_id, :user_id)
  end
end
