class Invitation < ActiveRecord::Base
	include RostersHelper, UsersHelper

	belongs_to :host, class_name: "User"
	belongs_to :recipient, class_name: "User"
	belongs_to :event

	attr_accessor :recipient_email

	before_validation :recipient_not_member, on: [ :create, :update ]

	validates :host_id, presence: true
	validate :recipient_already_attending

	protected

		def recipient_already_attending
			if Roster.where("rosters.attendee_id = ? AND rosters.attended_event_id = ?", self.recipient_id, self.event).present?
				self.errors.add(:base, "User is already attending event")
			end
		end

		def recipient_not_member
			if (user_id = get_user_id_by_email(self.recipient_email))
				self.recipient_id = user_id
			else
				self.errors.add(:base, "User is not a member")
			end
		end
end