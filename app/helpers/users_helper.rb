module UsersHelper

	def get_user_id_by_email(email)
		if user = User.find_by(email: email)
			user.id
		end
	end

end