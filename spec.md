# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
		- The bin/adventures file calls upon the CLI in lib/adventures/cli.rb
- [x] Pull data from an external source
		- Scrapes adventures from outbound.com with nokogiri in lib/adventures/scraper.rb and adventure.rb
- [x] Implement both list and detail views
		- List views include the methods list_activities and list_adventures in cli.rb
		- Detail view is in the list_details method in cli.rb

