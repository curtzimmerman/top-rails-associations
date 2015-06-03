class EventsController < ApplicationController
	
	def new
		@event = Event.new
	end

	def create
		@event = current_user.hosted_events.build(event_params)
		if @event.save
			flash[:success] = "Event successfully created"
			redirect_to current_user
		else
			flash.now[:danger] = "Errors in form"
			render 'new'
		end
	end

	def show
		@event = Event.find_by(id: params[:id])
	end

	def index
		@events = Event.all
	end

	def update
		@event = Event.find_by(id: params[:id])
		if params[:attendee]
			user = User.find_by(id: params[:attendee])
			@event.add_attendee(user)
			flash[:success] = "Attending this event!"
			redirect_to @event
		else
			flash.now[:danger] = "Form Error"
			render 'show'
		end
	end

	private

		def event_params
			params.require(:event).permit(:name, :description, :start_time, :attendee)
		end
	
end
