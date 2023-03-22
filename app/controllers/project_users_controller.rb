class ProjectUsersController < ApplicationController

  def create
  @project_users = ProjectUser.new(project_params)
    if @project_user.save!
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end
end
