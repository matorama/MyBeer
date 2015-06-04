namespace :scraper do
  desc "fetch beer posts from BreweryDB"
  task scrape: :environment do
  	require 'open-uri'
  	require 'json'

  	# Set API token and URL
  	key = "d2eddea7b59ad8f6e9e62ff6c677bce6"
  	endpoint = "http://api.brewerydb.com/v2/beers"

    page = 4
    while page < 153 do

    	# Specify request parameters
    	params = {
    	  withBreweries: "Y",	
    	  availableId: 1,
    	  p: page,
    	  key: key
    	  
    	  
    	}

    	# Prepare API request
    	uri = URI.parse(endpoint)
    	uri.query = URI.encode_www_form(params)

    	# Submit request
    	result = JSON.parse(open(uri).read)

    	# Display results to screen
    	# puts result["data"].first["name"]
      # puts result["data"].first["breweries"].first["name"]
      # puts result["data"].first["description"]
      # puts result["data"].first["style"]["category"]["name"]
      # puts result["data"].first["abv"]
      # puts result["data"].fourth["labels"]["medium"]

        # Store results in database
      result["data"].each do |beer|

        # Create new Post
        @post = Post.new
        @post.name = beer["name"]
        @post.brewery = beer["breweries"].first["name"]
        @post.description = beer["description"]

        if beer["style"]
        	@post.style = beer["style"]["category"]["name"]
        else
        	@post.style = "not available"
        end


        @post.abv = beer["abv"]

        if beer["labels"]
        	@post.label= beer["labels"]["large"]
        else
        	@post.label = "http://i36.photobucket.com/albums/e1/tcole49/Consuming%20Ambitions/Beerbottle.jpg"
        end

        # Save Post
        @post.save
      end

      page +=1
    end

  end

  desc "Destroy all posting data"
  task destroy_all_posts: :environment do
  	Post.destroy_all
  end

end
