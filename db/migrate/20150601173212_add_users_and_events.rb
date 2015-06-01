class AddUsersAndEvents < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :name
  		t.timestamps null: false
  	end

  	create_table :events do |t|
  		t.references :host, class_name: "User"

  		t.string :name
  		t.datetime :start_time
  		t.datetime :end_time


  		t.timestamps null: false
  	end
  end
end
