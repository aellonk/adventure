class Adventures::Scraper
	def get_page
		doc = Nokogiri::HTML(open("https://www.theoutbound.com/new-york/#{activity}"))	
	end
	
	def scrape_adventure
		self.get_page.css("div.adventure-card--image")
	end

	def gather_adventures
		scrape_adventure.each do |a|
		 	Adventures::Adventure.new_from_scrape(a)
		end
	end

end