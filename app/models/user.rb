class User < ActiveRecord::Base
	has_many :events, foreign_key: "host_id"
end