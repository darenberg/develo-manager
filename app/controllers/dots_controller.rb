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

  def update
    @dot = Dot.find(params[:id])
    if @dot.update(dot_params)
      render json: @dot
    else
      render json: @dot.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @dot = Dot.find(params[:id])
    @project = @dot.plan.floor.project
    @dot.destroy
    redirect_to @project, notice: 'dot was successfully destroyed.'
  end

  private

  def dot_params
    params.require(:dot).permit(:x_position, :y_position, :plan_id)
  end
end
