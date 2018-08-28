module InvitationsHelper
	
	def build_invitation(user,event)
	    if user.invitations.build(attended_event_id: event.id).save
	  	  #flash[:success]= 'Friend is invited'
	  	  redirect_to events_path
	    else
	  	  render event_path(event)
	    end
	end
end
