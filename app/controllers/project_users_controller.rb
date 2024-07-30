class ProjectUsersController < ApplicationController
  before_action :set_project, only: [:autocomplete]

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

  def autocomplete
    query = params[:query]
    existing_user_ids = @project.project_users.pluck(:user_id)
    @users = User.where.not(id: existing_user_ids).where("email ILIKE ?", "%#{query}%").limit(10)
    render json: @users.map { |user| { id: user.id, email: user.email } }
  end

  private

  def project_user_params
    params.require(:project_user).permit(:project_id, :user_id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
