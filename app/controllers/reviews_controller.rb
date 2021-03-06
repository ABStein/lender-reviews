require 'review_scraper'
class ReviewsController < ApplicationController

	def index
		# allow user to use a url param to include any lender url
		url = params[:url]
		
		scraper = ReviewScraper.new(url)
		
		render json: { 
					   lender: scraper.lender_name,
					   reviews: scraper.reviews 
					 }
	end
end
