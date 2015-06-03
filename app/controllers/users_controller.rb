class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in(@user)
			flash[:success] = "Account Created Successfully"
			redirect_to @user
		else
			flash.now[:error] = "Form Errors"
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
		@upcoming_events = current_user.upcoming_events
		@previous_events = current_user.previous_events
	end


	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

end