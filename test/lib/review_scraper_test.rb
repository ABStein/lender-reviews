require 'review_scraper'
require 'nokogiri'
require 'httparty'

RSpec.describe ReviewScraper do
	describe '#reviews' do
		let(:bad_scraper) { ReviewScraper.new('https://www.lendingng/44068646') }
		let(:good_scraper) { ReviewScraper.new('https://www.lendingtree.com/reviews/mortgage/triumph-lending/44068646') } 

		it 'should raise an error' do
			expect{ bad_scraper }.to raise_error(RuntimeError, "Please enter a valid URL.")
		end

		it 'should parse the page' do
			puts good_scraper.reviews
			expect(good_scraper).to be_a(ReviewScraper)
			expect(good_scraper).to 
		end
	end
end
