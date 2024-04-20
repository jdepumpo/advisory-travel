# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://advisory.travel"

SitemapGenerator::Sitemap.create do
  add '/countries'
  add '/map'
  Countries.find_each do |country|
    add country_path(country), :lastmod => country.advisories.last.pub_date
  end

end
