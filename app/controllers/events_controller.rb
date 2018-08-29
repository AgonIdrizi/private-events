class EventsController < ApplicationController
  before_action :correct_user , only: [:update,:edit,:destroy]

  def index

      if request.fullpath == '/events'
      @events = Event.all.order('date DESC')
    elsif params[:upcoming]
      @events = Event.upcoming
    elsif params[:past]
      @events = Event.past
    end
  	 
  end

  def new
  	@event = Event.new
    
  end

  def create
  	@event = current_user.created_events.build(strong_params)
  	if @event.save
  		flash[:success] = 'Event created'
  		redirect_to events_path
  	else
  		render 'new'
  	end
  end

  def show
  	@event = Event.find_by(id: params[:id])
    @invitations = Invitation.new
    @user = User.new
  	@list_of_attendees = @event.attendees
  end

  def edit
    
  end

  def update
    @event = current_user.created_events.update(strong_params)
    if @event.save
      flash[:success] = 'Event updated'
      redirect_to @event
    else
      flash.now[:danger] = 'Update failed'
      render 'edit'
    end

  end

  def destroy

  end
    
  

  private

  def correct_user
    @event=current_user.created_events.find_by(id: params[:id])
    redirect_to root_url if @event.nil?
  end

  #def paginate
    #.paginate(page: params[:page], :per_page => 8)
  #end
  

  def strong_params
    params.require(:event).permit(:description,:location,:title, :date)
  end
end
