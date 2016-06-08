# This is a template for a Ruby scraper on morph.io (https://morph.io)
# including some code snippets below that you should find helpful

require 'scraperwiki'
require 'JSON'

url = "https://www.livetraffic.com/traffic/hazards/incident.json"
json = JSON.parse(open(url).read)

incidents = json["features"]

incidents.each do |incident|
  p incident

  record = {
    id: incident["id"],
    json: incident.to_s
  }

  ScraperWiki.save_sqlite([:id], record)
end
