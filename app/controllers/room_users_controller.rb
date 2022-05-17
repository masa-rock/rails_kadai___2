class RoomUsersController < ApplicationController
  def index
    @room_users = RoomUser.all
  end

  def new
    @provide_data = RoomUser.new(params.permit(:user_id,:room_id,:start_date,:end_date,:people))
    validate_reserve_room(@provide_data.start_date,@provide_data.end_date,@provide_data.people)
    @room = Room.find_by(id: @provide_data.room_id)
    @totalamount = total_amount(@room.cost,@provide_data.people)
    @days = days_count(@provide_data.start_date,@provide_data.end_date)
    @room_user = RoomUser.new
  end

  def create
    @room_user = RoomUser.new(params.require(:room_user).permit(:user_id,:room_id,:start_date,:end_date,:people,:days,:totalamount))
    if @room_user.save
      redirect_to room_user_path(@room_user.id)
      flash[:notice] = "Reservation was successfully created"
    else
      render edit_room_path(@room_user.room_id)
    end
  end

  def show
    @room_user = RoomUser.find(params[:id])
    @room = Room.find_by(id:@room_user.room_id)
  end

  private
  def days_count(start_date,end_date)
    second_count = end_date - start_date
    days_count = (second_count/1.days).floor
    return days_count
  end

  def total_amount(cost,people)
    total_amount = cost * people
    return total_amount
  end

  def validate_reserve_room(start_date,end_date,people)
    if start_date > end_date
      flash[:alert] = "終了日は開始日より後にしてください"
      redirect_to room_path(@provide_data.room_id)
    elsif start_date < Date.today
      flash[:alert] = "過去の日付は無効です"
      redirect_to room_path(@provide_data.room_id)
    elsif people < 0
      flash[:alert] = "人数が無効です"
      redirect_to room_path(@provide_data.room_id)
    end
  end
end
