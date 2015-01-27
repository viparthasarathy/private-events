class EventsController < ApplicationController


	def new
		@event = Event.new
	end

	def create
		@event = current_user.created_events.build(event_params)
		if @event.save
			flash[:success] = "You have created a new event!"
			redirect_to @event
		else
			flash.now[:danger] = "Invalid parameters."
			render 'new'
		end
	end


	def show
		@event = Event.find(params[:id])
		@attendees = @event.attendees.all
		@creator = @event.creator
	end

	def index
		@upcoming = Event.upcoming
		@past     = Event.past
	end

	private

	def event_params
		params.require(:event).permit(:title, :description, :date)
	end

end
