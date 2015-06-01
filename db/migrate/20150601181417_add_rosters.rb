class AddRosters < ActiveRecord::Migration
  def change
  	create_table :rosters do |t|
  		t.references :event
  		t.references :attendee, class_name: "User"
  	end
  end
end
