class InvitationsController < ApplicationController
	include UsersHelper

	def create
		@invitation = current_user.invitations.create(invitation_params)
		if @invitation.save
			flash[:success] = "Invitation sent"
			@invitation.add_user_to_roster(@invitation.recipient_id, @invitation.event_id)
			redirect_to event_path(@invitation.event_id)
		else
			flash[:danger] = "Something isn't right, #{@invitation.errors.full_messages}"
			@event = Event.find(params[:invitation][:event_id])
			redirect_to event_path(@event)	
		end
	end

	private

		def invitation_params
			params.require(:invitation).permit(:message, :event_id, :recipient_email )
		end
end