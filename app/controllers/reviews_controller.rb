require 'review_scraper'
class ReviewsController < ApplicationController

	def index
		url = params[:url]
		
		scraper = ReviewScraper.new(url)
		
		render json: { reviews: scraper.reviews }
	end
end
