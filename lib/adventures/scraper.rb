class Adventures::Scraper
	def get_page
		 doc = Nokogiri::HTML(open("https://www.theoutbound.com/new-york/backpacking"))	
	end
	
	def scrape_adventure
		self.get_page.css("div.adventure-card--image")
	end
end