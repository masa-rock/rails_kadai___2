class RoomsController < ApplicationController
  def index
  end

  def new
    @room =Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name,:introduction,:cost,:address,:image,:user_id))
    if @room.save
      redirect_to action: :show,id: @room.id
      flash[:notice] = "Room was successfully created."
    else
      render "new_room"
    end
  end
  
  def show
    @room = Room.find(params[:id])
    if user_signed_in?
      @user = User.find_by(id:current_user.id)
    end
  end

  def posts
    @rooms = Room.where(user_id:current_user.id)
  end

  def search
    @area = Room.where("address LIKE ?","%#{params[:area]}%")
    @area_s = @area.where("introduction LIKE ?","%#{params[:keyword]}%")
    @counter = @area_s.count
  end
end
