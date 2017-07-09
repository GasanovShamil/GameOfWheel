class RoomsController < ApplicationController
	before_action :set_room, only: [:show, :edit, :update, :destroy, :participate]

	def index
		@rooms = Room.paginate(page: params[:page], per_page: 9).includes(:prize)
	end

	def show
		@created_by = User.find(@room.created_by)
		@is_over = @room.winner != nil
		@winner = (@is_over && @room.winner > 0) ? User.find(@room.winner) : nil
		@my_shares = current_user.rooms.where('rooms.id = ?', @room.id).count
		@all_shares = UserRoom.where('room_id = ?', @room.id).count
	end

	def new
		@room = Room.new
	end

	def edit
	end

	def create
		@room = Room.new room_params
		@room.created_by = current_user.id

		if @room.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def update
		if @room.update room_params
			redirect_to @room
		else
			render 'edit'
		end
	end

	def destroy
		@room.destroy
		redirect_to rooms_path
	end

	def participate
		me = User.find(current_user.id)
		participation = UserRoom.create({ :user => me, :room => @room, :participation_date => DateTime.now })

		if participation.valid?
			me.tokens -= @room.share_price
			me.save
			flash[:success] = "Participation confirmée !"
		else
			flash[:danger] = participation.errors.first.second
		end

		redirect_to @room
	end

	private

	def set_room
		@room = Room.find(params[:id])
	end

	def room_params
		params.require(:room).permit(:prize_id, :start_date, :end_date, :share_price, :created_by)
	end
end