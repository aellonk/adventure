class Adventures::Adventure

	attr_accessor :title, :location

	@@all = []
	
	def self.new_from_scrape(a)
		self.new(
			a.css("div.info h3.title").text,
			a.css("div.info p.location").text.strip
		)
	end

	def initialize(title = nil, location = nil)
		@title = title
		@location = location
		@@all << self
	end
end