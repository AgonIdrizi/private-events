class UsersController < ApplicationController
  
  def show
  	@user = User.find_by(id: params[:id])
  	
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(strong_params)
  	if @user.save
  		flash[:success] = 'New user is created'
      log_in @user
  		redirect_to events_path
  	else
  		#flash.now[:danger] = 'There is error in your form'
  		render 'users/new'
  	end
  end



  def my_events
    @events = current_user.created_events
    if params[:request] || request.fullpath == 'user_events'
      @events
    elsif params[:upcoming]
      @events = current_user.attended_events.upcoming
    elsif params[:past]
      @events = current_user.attended_events.past
    end
      
  end

  def strong_params
  	params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
