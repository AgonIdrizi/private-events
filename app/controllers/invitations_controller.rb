class InvitationsController < ApplicationController
  def new
  	
  end

  def create
  	event = Event.find_by(id: params[:event][:id])
  	user = User.find_by(id: params[:user][:id])
    invitation = Invitation.new
  	if Invitation.already_invited(user,event)
  		redirect_to event_path(event) 	
      flash[:danger] = 'Friend is alredy invited'
  	else
  	  build_invitation(user,event)
	  end
  end
end
