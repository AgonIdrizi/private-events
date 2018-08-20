class SessionsController < ApplicationController
	
	def new

	end

	def create
		user = User.find_by(name: params[:session][:name])
		if User.exists?(id: user.id)
			log_in(user)
			redirect_to user
		else
			render 'new'
		end
		
	end

	def destroy

	end
end
