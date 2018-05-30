class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      flash[:notice] = "El producto ha sido eliminado exitosamente"
      render :new
    end
  end

  protected
    def room_params
      params.require(:room).permit(:title, :description, :beds, :guests, :image_url)
    end
end
