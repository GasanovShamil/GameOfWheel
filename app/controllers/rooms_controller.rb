class RoomsController < ApplicationController
	load_and_authorize_resource except: [:index, :show, :participate, :showmyrooms]
	before_action :authenticate_user!, :set_room, only: [:show, :participate, :showmyrooms]
	before_action :set_search, only: :index

	def index
		@rooms = Room.all

		if @searchBefore != nil && @searchBefore != ''
			@rooms = @rooms.search(end_date: { lt: @searchBefore })
		end

		if @searchAfter != nil && @searchAfter != ''
			@rooms = @rooms.search(start_date: { gteq: @searchAfter })
		end

		if @searchPrice != nil && @searchPrice != ''
			@rooms = @rooms.search(prize_price: { lteq: @searchPrice })
		end

		if @searchParticipation != nil && @searchParticipation != ''
			@rooms = @rooms.where('share_price <= ? ', @searchParticipation)
		end

		@rooms = @rooms.paginate(page: params[:page], per_page: 9).includes(:prize)
	end

	def show
		@created_by = User.find(@room.created_by)
		@winner = @room.winner != nil ? (@room.winner > 0 ? User.find(@room.winner) : -1) : nil
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

	def showmyrooms
		@my_rooms = current_user.rooms.select("DISTINCT rooms.*")
	end

	private

	def set_room
		@room = Room.find(params[:id])
	end

	def set_search
		@searchBefore = params[:searchBefore]
		@searchAfter = params[:searchAfter]
		@searchPrice = params[:searchPrice]
		@searchParticipation = params[:searchParticipation]
	end

	def room_params
		params.require(:room).permit(:prize_id, :start_date, :end_date, :share_price, :created_by)
	end
end