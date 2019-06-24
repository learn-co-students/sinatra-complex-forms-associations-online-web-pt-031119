# Add seed data here. Seed your database with `rake db:seed`
sophie = Owner.create(name: "Sophie")
Pet.create(name: "Maddy", owner: sophie)
Pet.create(name: "Nona", owner: sophie)
kelly = Owner.create(name: "kelly")
Pet.create(name: "tiff", owner: kelly)
Pet.create(name: "sandra", owner: kelly)
