class Event < ActiveRecord::Base
	belongs_to :host, class_name: "User"
	has_many :attendees, through: :rosters, foreign_key: "attendee_id"
	has_many :rosters, foreign_key: "attended_event_id"

	has_many :invitations

	scope :past_events, -> { where("start_time < ?", Time.now).order(start_time: :desc) }
	scope :future_events, -> { where("start_time > ?", Time.now).order(start_time: :asc) }

	def add_attendee(user)
		attendees << user
	end

	#def Event.past
	#	Event.all.where("start_time < ?", Time.now).order(start_time: :desc)
	#end

	#def Event.future
	#	Event.all.where("start_time > ?", Time.now).order(start_time: :asc)
	#end
end