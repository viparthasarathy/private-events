class InvitesController < ApplicationController

	def create
		@event = Event.find(params[:invite][:attended_event_id])
		current_user.invites.create(attended_event_id: @event.id)
		redirect_to @event
	end

	def destroy
		@event = Event.find(params[:invite][:attended_event_id])
		current_user.invites.destroy(attended_event_id: @event.id)
		redirect_to @event
	end

end
