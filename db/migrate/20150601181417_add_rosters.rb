class AddRosters < ActiveRecord::Migration
  def change
  	create_table :rosters do |t|
  		t.references :attended_event, class_name: "Event"
  		t.references :attendee, class_name: "User"
  	end
  end
end
