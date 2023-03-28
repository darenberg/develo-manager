class DotsController < ApplicationController
  def create
    @dot = Dot.new
    @plan = Plan.find(params[:plan_id])
    @dot.plan = @plan


    if @dot.save!
      redirect_to @plan.floor.project
    else
      render :new, status: :unprocessable_entity
    end
  end


end
