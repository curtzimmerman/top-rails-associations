u = User.new(name: "burt")
u.save
u2 = User.new(name: "frank")
u2.save
e = Event.new(name: "event1")
e.host = User.find 1
e.save
e = Event.new(name: "event2")
e.host = User.find 1
e.save


validations on user model
create new user
	new user view
		form helper
	new user controller
