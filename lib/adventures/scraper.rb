class Adventures::Scraper
	def get_page(activity, state)
		doc = Nokogiri::HTML(open("https://www.theoutbound.com/#{state}/#{activity_url_creator(activity)}"))	
	end
	
	def activity_url_creator(activity)
		activity.gsub(' ', '-')
	end

	def scrape_adventure(activity, state)
		self.get_page(activity, state).css("div.adventure-card--image")
	end

	def gather_adventures(activity, state)
		scrape_adventure(activity, state).each do |a|
		 	Adventures::Adventure.new_from_scrape(a)
		end
	end

	def title_url_creator(title)
		title.downcase.gsub(' ', '-')
	end

end