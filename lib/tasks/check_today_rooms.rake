namespace :admin  do
	desc "Check the rooms that ended today to get the winner"
	task :check_today_rooms => :environment do
		rooms = Room.where('end_date = ?', Date.today - 1.days)
		rooms.each do |room|
			shares = UserRoom.where('room_id = ?', room.id).order('participation_date')

			if shares.any?
				room.winner = shares[rand(shares.count)].user_id
			else
				room.winner = -1
			end

			room.save
		end
	end
end