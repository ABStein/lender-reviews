# class Scraper
# 	attr_accessor :scrape # used to create setter and getter methods for instance variables so that they can be accessed outside the class

# 	def initialize(url)
# 		if url =~ /\A#{URI::regexp}\z/ && url.include?("www.lendingtree.com/reviews")
# 	  		@scrape = Nokogiri::HTML(HTTParty.get(url))
# 	  	else
# 	  		raise "Please enter a valid URL."
# 	  	end
# 	end

# 	def get_review_title
# 		review.css('.reviewTitle').children.map do |title|
# 			title.text
# 		end
# 	end

# 	def get_review_body
# 		review.css('p.reviewText').children.map do |body|
# 			body.text
# 		end
# 	end

# 	def get_review_author
# 		review.css('p.consumerName').css('span').children.map do |author|
# 			author.text
# 		end
# 	end

# 	def get_review_date
# 		review.css('p.consumerReviewDate').children.map do |date|
# 			date.text
# 		end
# 	end

# 	def review
# 		scrape.css('div.reviewDetail')
# 	end

# 	def get_star_count
# 		scrape.css('div.starReviews').css('.recommended').css('.numRec').children.map do |star|
# 			star.text
# 		end
# 	end

# 	scraper = Scraper.new('https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183')

# 	titles = scraper.get_review_title.compact
# 	bodys = scraper.get_review_body.compact
# 	authors = scraper.get_review_author.compact
# 	dates = scraper.get_review_date.compact
# 	stars = scraper.get_star_count.compact

# 	(0...bodys.size).each do |index|
# 		 puts review = {
# 			 review_id: "#{index + 1}",
# 			 review_title: "#{titles[index]}",
# 			 review_body: "#{bodys[index]}",
# 			 review_author: "#{authors[index]}",
# 			 review_date: "#{dates[index]}",
# 			 star_count: "Star Count: #{stars[index]}"
# 		}
# 	end
# end








# 	class Scraper
# 		def scrape_page(url)
# 			if url =~ /\A#{URI::regexp}\z/ && url.include?("www.lendingtree.com/reviews")
# 		  		scrape = Nokogiri::HTML(HTTParty.get(url))
# 		  	else
# 		  		raise "Please enter a valid URL."
# 		  	end
# 		end
# 	end

# 	scraper = Scraper.new
# 	scraped_page = scraper.scrape_page('https://www.lendingtree.com/reviews/mortgage/triumph-lending/44068646')
# 	reviews = scraped_page.css('div.mainReviews')

# 	reviews.each do |review|
# 		puts review = {
# 			 review_title: review.css('p.reviewTitle').text,
# 			 review_body: review.css('p.reviewText').text,
# 			 review_author: review.css('p.consumerName').text,
# 			 review_date: review.css('p.consumerReviewDate').text,
# 			 star_count: review.css('div.numRec').text
# 		}
# 	end


# 	RSpec.describe Scraper do
# 		describe '#scrape_page' do
# 			let(:scraper) { Scraper.new }

# 			it 'should raise an error' do
# 				expect{ scraper.scrape_page('https://www.lendingng/44068646') }.to raise_error(RuntimeError, "Please enter a valid URL.")
# 			end

# 			it 'should parse the page' do
# 				expect(scraper.scrape_page('https://www.lendingtree.com/reviews/mortgage/triumph-lending/44068646')).to equal('')
# 			end
# 		end
# 	end
