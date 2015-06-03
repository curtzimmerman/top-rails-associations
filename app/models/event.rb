class Event < ActiveRecord::Base
	belongs_to :host, class_name: "User"
	has_many :attendees, through: :rosters, foreign_key: "attendee_id"
	has_many :rosters, foreign_key: "attended_event_id"

	def add_attendee(user)
		attendees << user
	end
end