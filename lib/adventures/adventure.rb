class Adventures::Adventure

	attr_accessor :title, :location, :url, :suggested_activities, :skill_level, :season, :trail_type, :rt_distance, :elevation_gain, :description

	@@all = []

	def self.new_from_scrape(a)
		self.new(
			a.css("div.info h3.title").text,
			a.css("div.info p.location").text.strip
			"https://www.theoutbound.com/#{a.css("a").attribute("href").text}"
		)
	end

	def initialize(title = nil, location = nil, url = nil)
		@title = title
		@location = location
		@url = url
		@@all << self
	end

	def self.all
		@@all
	end

end