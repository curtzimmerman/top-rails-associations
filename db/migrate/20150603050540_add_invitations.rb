class AddInvitations < ActiveRecord::Migration
  def change
  	create_table :invitations do |t|
  		t.references :host, class_name: "User"
  		t.references :recipient, class_name: "User"
  		t.references :event

  		t.text :message, default: "You have been invited to an event"
  		t.timestamps null: false
  	end
  end
end
