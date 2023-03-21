class RoomsController < ApplicationController
  def create
    @room = room.new(room_params)
    @project = Project.find(params[:project_id])
    @room.project = @project

    if @room.save
      redirect_to project_room_path(@project, @room)
    else
      render "projects/show", status: :unprocessable_entity
    end
  end

  def update
    @room.update(room_params)
    redirect_to room_path(@room)
  end

  def destroy
    @room.destroy
    redirect_to rooms_path, status: :see_other
  end

  private

  def room_params
    params.require(:room).permit(:name, :project_id)
  end
end
