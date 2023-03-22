class FloorsController < ApplicationController
  def create
    @floor = Floor.new(floor_params)
    @project = Project.find(params[:project_id])
    @floor.project = @project

    if @floor.save!
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @floor = Floor.find(params[:id])
    @floor.destroy
    redirect_to project_path, notice: 'floor was successfully destroyed.'
  end

  def update
    @floor.update(floor_params)
  end
  private

  def floor_params
    params.require(:floor).permit(:number)
  end
end
