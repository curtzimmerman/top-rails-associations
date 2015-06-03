module EventsHelper

	def user_attending?(user)
		@event.attendees.include?(User.find_by(id: user.id))
	end
end
