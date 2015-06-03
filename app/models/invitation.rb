class Invitation < ActiveRecord::Base
	belongs_to :host, class_name: "User"
	belongs_to :recipient, class_name: "User"
	belongs_to :event

end