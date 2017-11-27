class Adventures::Scraper
	def get_page(activity, state)
		doc = Nokogiri::HTML(open("https://www.theoutbound.com/#{state}/#{activity}"))	
	end
	
	def scrape_adventure(activity, state)
		self.get_page(activity, state).css("div.adventure-card--image")
	end

	def gather_adventures(activity, state)
		scrape_adventure(activity, state).each do |a|
		 	Adventures::Adventure.new_from_scrape(a)
		end
	end

end