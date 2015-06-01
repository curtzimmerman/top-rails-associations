class User < ActiveRecord::Base
	has_many :events, foreign_key: "host_id"
	has_many :events, through: :rosters
	has_many :rosters, foreign_key: "attendee_id"
end