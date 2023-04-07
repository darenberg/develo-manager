class FloorsController < ApplicationController
  def create
    @floor = Floor.new(floor_params)
    @project = Project.find(params[:project_id])
    @floor.project = @project
    if @floor.save!
      create_floor_plans(@floor)
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @floor = Floor.find(params[:id])
    @project = @floor.project
    @floor.destroy
    redirect_to project_path(@project), notice: 'floor was successfully destroyed.', status: :see_other
  end

  def delete_floor
    floor = params[:floor]
    active_button_id = session["active_button_#{floor}"]

    if active_button_id.present?
      session.delete("active_button_#{floor}")
      Button.find_by(id: active_button_id).destroy
      flash[:success] = "Floor #{floor} and its associated button have been deleted."
    else
      flash[:error] = "No active button found for floor #{floor}."
    end

  end

  private

  def create_floor_plans(floor)
    Plan::STAGES.each do |stage|
      Plan.create!(stage: stage, floor: floor)
    end
  end

  def floor_params
    params.require(:floor).permit(:number)
  end
end
