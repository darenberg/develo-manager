class DotsController < ApplicationController
  def create
    @dot = Dot.new
    @plan = Plan.find(params[:plan_id])
    @dot.plan = @plan
    @project = @plan.floor.project
    @tasks = @project.tasks
    if @dot.save
      redirect_to @project
      # render "projects/show", status: :ok, location: @project
    else
      render :new, status: :unprocessable_entity
    end
  end
end
