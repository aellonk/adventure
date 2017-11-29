class Adventures::CLI

	@@ACTIVITIES = [["Backpacking", "Bodysurfing", "Camping", "Canoeing"], ["Cycling", "Diving", "Fishing", "Fitness"], ["Hiking", "Kayaking", "Kiteboarding", "Mountain Biking"], ["Photography", "Rafting", "Rock Climbing", "Running"], ["Skiing", "Snowboarding", "Snowshoeing", "Stand Up Paddle"], ["Surfing", "Swimming", "Yoga"]]

	def call
		puts "Welcome, let's find your next adventure!"
		start
	end

	def start
		puts "Which state would you like to see adventures for?"
		state = gets.strip.downcase.gsub(' ', '-')
		puts "\n"
		puts "What kind of activity are you in the mood for? Enter the number."
		puts "\n"
		list_activities
		input = gets.strip.to_i
		puts "\n"
		activity = @@ACTIVITIES.flatten[input - 1].downcase
		Adventures::Scraper.new.gather_adventures(activity, state)
		case activity
		when 1..23
			puts "The following adventures are recommended for #{activity}:"
		end
		puts "\n"
		list_adventures
		puts "\n"
		puts "Which adventure would you like to learn more about? Enter the number."
		choice = gets.strip.to_i
		puts "\n"
		count = Adventures::Adventure.all.size
		case choice
		when 1..count
			puts "Here are the details:"
			puts "\n"
		end
		adventure = Adventures::Adventure.find(choice)
	end

	def list_activities
		activities = @@ACTIVITIES[0].collect.with_index {|activity, index|
			 "#{index +1}. #{activity} " }
			puts activities.join

		activities = @@ACTIVITIES[1].collect.with_index(4) {|activity, index|
			 "#{index +1}. #{activity} " }
			puts activities.join

		activities = @@ACTIVITIES[2].collect.with_index(8) {|activity, index|
			 "#{index +1}. #{activity} " }
			puts activities.join

		activities = @@ACTIVITIES[3].collect.with_index(12) {|activity, index|
			 "#{index +1}. #{activity} " }
			puts activities.join

		activities = @@ACTIVITIES[4].collect.with_index(16) {|activity, index|
			 "#{index +1}. #{activity} " }

		activities = @@ACTIVITIES[5].collect.with_index(20) {|activity, index|
			 "#{index +1}. #{activity} " }
			puts activities.join
	end

	def list_adventures
		 Adventures::Adventure.all.each_with_index do |a, index|
		 	puts "#{index + 1}. #{a.title} (#{a.location})"
		 end
	end
end
