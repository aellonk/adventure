class Adventures::Adventure

	attr_accessor :title, :location, :url, :suggested_activities, :skill_level, :season, :trail_type, :rt_distance, :elevation_gain, :summary, :description

	@@all = []

	def self.new_from_scrape(a)
		self.new(
			a.css("div.info h3.title").text,
			a.css("div.info p.location").text.strip,
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

	def self.find(id)
		self.all[id -1]
	end

	def doc
		@doc ||= Nokogiri::HTML(open(self.url))
	end

	def suggested_activities
		@suggested_activities ||= doc.xpath("//div[@class='keylineb m2y']/ul/li[1]/p[2]").text
	end

	def skill_level
		@skill_level ||= doc.xpath("//div[@class='keylineb m2y']/ul/li[2]/p[2]").text
	end

	def season
		@season ||= doc.xpath("//div[@class='keylineb m2y']/ul/li[3]/p[2]").text
	end

	def trail_type
		@trail_type ||= doc.xpath("//div[@class='keylineb m2y']/ul/li[4]/p[2]").text
	end

	def rt_distance
		@rt_distance ||= doc.xpath("//div[@class='keylineb m2y']/ul/li[5]/p[2]").text
	end

	def elevation_gain
		@elevation_gain ||= doc.xpath("//div[@class='keylineb m2y']/ul/li[6]/p[2]").text
	end

	def summary
		@summary ||= doc.xpath("//div[@class='section summary blurb pad2b']/p").text
	end

	def description
		@description ||= doc.xpath("//span[@class='adventure-description']/p").collect { |para|
			para.text
		}.join("\n\n")
	end

end