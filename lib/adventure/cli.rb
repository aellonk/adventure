class Adventure::CLI

	@@ACTIVITIES = [["Backpacking", "Bodysurfing", "Camping", "Canoeing"],["Cycling", "Diving", "Fishing", "Fitness"],["Hiking", "Kayaking", "Kiteboarding", "Mountain Biking"],["Photography", "Rafting", "Rock Climbing", "Running"],["Skiing", "Snowboarding", "Snowshoeing", "Stand Up Paddle"],["Surfing", "Swimming", "Yoga"]]

	def call
		puts "Welcome, let's find your next adventure!"
		puts "Which state would you like to see adventures for?"
		input = gets.strip.downcase.gsub(' ', '-')
		puts "What kind of adventure are you in the mood for? Enter the number."
		puts "\n"
		list_activities
		puts "\n"
		activity = gets.strip.to_i
		list_adventures
	end

	def list_activities
		activities = @@ACTIVITIES[0].collect.each_with_index { |activity, index|
			"#{index +1}. #{activity}  " }
		puts activities.join

		activities = @@ACTIVITIES[1].collect.with_index(4) { |activity, index|
			"#{index +1}. #{activity}  " }
		puts activities.join

		activities = @@ACTIVITIES[2].collect.with_index(8) { |activity, index|
			"#{index +1}. #{activity}  " }
		puts activities.join

		activities = @@ACTIVITIES[3].collect.with_index(12) { |activity, index|
			"#{index +1}. #{activity}  " }
		puts activities.join

		activities = @@ACTIVITIES[4].collect.with_index(16) { |activity, index|
			"#{index +1}. #{activity}  " }
		puts activities.join

		activities = @@ACTIVITIES[5].collect.with_index(20) { |activity, index|
			"#{index +1}. #{activity}  " }
		puts activities.join
	end

	def list_adventures
		puts "1. Hike the Devil's Path\n2. Hike to Sugarloaf Mountain\n3. Hike to Chittenango Falls\n4. Hike Storm King Mountain"
	end

end
