# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
User.create(athena: "athena",
password: "secret",
password_confirmation: "secret"
)
User.create(athena: "dave",
password: "secret",
password_confirmation: "secret"
)

Event.delete_all
Event.create(date: "2012-02-13",
time: "09:30",
place: "Z-Center",
description: "Fun times.",
title: "Go for a run",
owner: 1
)
Event.create(date: "2012-02-15",
time: "11:30",
place: "Z-Center",
description: "Fun times.",
title: "Go for a jog",
owner: 1
)
Event.create(date: "2012-02-17",
time: "13:30",
place: "Z-Center",
description: "Fun times.",
title: "Elliptical anyone?",
owner: 1
)
Event.create(date: "2012-02-19",
time: "15:30",
place: "Z-Center",
description: "Fun times.",
title: "Erging",
owner: 1
)

Profile.delete_all
Profile.create(id: 1,
name: nil,
course: nil,
bio: nil,
visible: false,
user_id: 1)

Profile.create(id: 1,
name: nil,
course: nil,
bio: nil,
visible: false,
user_id: 2)
