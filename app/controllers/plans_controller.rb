class PlansController < ApplicationController
  def create
    @plan = Plan.new(plan_params)
    @floor = Floor.find(params[:floor_id])
    @plan.floor = @floor
    if @plan.save!
      redirect_to @floor.project
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @plan.update(plan_params)
  end
  private

  def plan_params
    params.require(:plan).permit(:stage)
  end
end
