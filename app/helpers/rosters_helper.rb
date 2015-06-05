module RostersHelper

	def add_user_to_roster(user, event)
		Roster.create(attendee_id: user, attended_event_id: event)
	end

end