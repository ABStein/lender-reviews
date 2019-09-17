class ReviewScraper
	attr_accessor :scrape # used to create setter and getter methods for instance variables so that they can be accessed outside the class

	def initialize(url)
		if url =~ /\A#{URI::regexp}\z/ && url.include?("www.lendingtree.com/reviews")
	  		@scrape = Nokogiri::HTML(HTTParty.get(url))
	  	else
	  		raise "Please enter a valid URL."
	  	end
	end

	def reviews	
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
		arr
	end
end