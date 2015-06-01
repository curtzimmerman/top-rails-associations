class Event < ActiveRecord::Base
	belongs_to :host, class_name: "User"
	has_many :attendees, through: :rosters, foreign_key: "attendee_id"
	has_many :rosters
end