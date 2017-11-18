class Adventure::CLI
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
end
