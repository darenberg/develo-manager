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

  def create
    @dot = Dot.new(dot_params)
    if @dot.save
      redirect_to @dot
    else
      render @project
    end
  end

  private

  def dot_params
    params.require(:dot).permit(:x_position, :y_position)
  end

end
