class InvitesController < ApplicationController

	def create
		@event = Event.find(params[:invite][:attended_event_id])
		current_user.invites.create(attended_event_id: @event.id)
		redirect_to current_user
	end

	def destroy
		@invite = Invite.find(params[:id])
		current_user.invites.destroy(@invite)
		redirect_to current_user
	end

end
