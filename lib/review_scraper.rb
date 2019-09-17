class ReviewScraper
	attr_accessor :scrape

	def initialize(url)
		# regex check to ensure the url is valid and another check to 
	    # ensure lendingtree urls are being used 
		if url =~ /\A#{URI::regexp}\z/ && url.include?("www.lendingtree.com/reviews")
	  		@scrape = Nokogiri::HTML(HTTParty.get(url))
	  	else
	  		raise "Please enter a valid URL."
	  	end
	end

	def lender_name
		scrape.css('div.lenderInfo h1').text
	end

	def reviews	
		# scrape all review nodes and display specific nodes
		# available within a review as a Hash.
		arr = [] 
		scrape.css('.mainReviews').each do |review|
			arr << {
				review_title: review.css('p.reviewTitle').text,
				review_body: review.css('p.reviewText').text,
				review_author: review.css('p.consumerName').text,
				review_date: review.css('p.consumerReviewDate').text,
				star_count: review.css('div.numRec').text
		 	}
		end
		return arr
	end
end