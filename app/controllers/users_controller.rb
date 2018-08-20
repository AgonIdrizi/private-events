class UsersController < ApplicationController
  
  def show
  	@user = User.find_by(id: params[:id])
  	@created_events = @user.created_events
  	@upcoming_events = @user.attended_events.upcoming
  	@previous_events = @user.attended_events.past
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(strong_params)
  	if @user.save
  		flash[:success] = 'New user is created'
  		redirect_to @user
  	else
  		flash[:danger] = 'This name is taken, please enter another one'
  		render 'new'
  	end
  end

  def strong_params
  	params.require(:user).permit(:name)
  end
end
