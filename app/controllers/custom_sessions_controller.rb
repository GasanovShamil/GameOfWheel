class CustomSessionsController < Devise::SessionsController
  before_filter :before_login, :only => :create
  after_filter :after_login, :only => :create

  def before_login
  end

  def after_login
  	if current_user.last_sign_in_at <= Date.today - 1.days
  		user = User.find(current_user.id)
  		newtoken = user.tokens + 200
  		user.tokens =  newtoken
  		current_user.tokens = newtoken
  		user.save
  	end
  end
end