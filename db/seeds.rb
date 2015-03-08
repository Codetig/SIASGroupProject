# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Bucket.destroy_all
Track.destroy_all

sue = User.create(first_name: "Sue", last_name: "Lucas", fb_id: 1)
ife = User.create(first_name: "Ife", last_name: "Omoniyi", fb_id: 2)
aparna = User.create(first_name: "Aparna", last_name: "Sainath", fb_id: 3)
shilpa = User.create(first_name: "Shilpa", last_name: "Kumar", fb_id: 4)

happy = Bucket.create(name:"Happy", desc:"I'm so happy")
sad = Bucket.create(name:"Sad", desc:"I'm so sad")
workout = Bucket.create(name:"Workout", desc:"Time to run")
sleepy = Bucket.create(name:"Sleepy", desc:"I want to go to bed")

yesterday = Track.create(title: "Yesterday", spotify_track_id: "3x6ElAgBpyvhGcWRQl7Pwh", track_uri: "spotify:track:3x6ElAgBpyvhGcWRQl7Pwh")
younger = Track.create(title: "Younger than Yesterday", spotify_track_id: "5MnbwlRJykPwBFWxPcMBne", track_uri: "spotify:track:5MnbwlRJykPwBFWxPcMBne")
just = Track.create(title: "Just One Yesterday", spotify_track_id: "0l2p5mDOP3czJ2FpD6zWie", track_uri: "spotify:track:0l2p5mDOP3czJ2FpD6zWie")

sue.buckets << happy
ife.buckets << sad
aparna.buckets << workout
shilpa.buckets << sleepy 
sue.buckets << workout 


happy.tracks << yesterday
happy.tracks << younger 
happy.tracks << just 

sad.tracks << just 
workout.tracks << younger
workout.tracks << just 

