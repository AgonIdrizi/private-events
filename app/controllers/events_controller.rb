class EventsController < ApplicationController
  def index
  	@events_past = Event.past
  	@events_upcoming = Event.upcoming
  end

  def new
  	@event = Event.new
  end

  def create
  	event = current_user.created_events.build(strong_params)
  	if event.save
  		flash[:success] = 'Event created'
  		redirect_to events_path
  	else
  		render 'new'
  	end
  end

  def show
  	@event = Event.find_by(id: params[:id])
  	@list_of_attendees = @event.attendees
  end

  def strong_params
    params.require(:event).permit(:description)
  end
end
