require 'review_scraper'
require 'nokogiri'
require 'httparty'

RSpec.describe ReviewScraper do
	describe '#review_scraper' do
		let(:bad_scraper) { ReviewScraper.new('https://www.lendingng/44068646') }
		let(:good_scraper) { ReviewScraper.new('https://www.lendingtree.com/reviews/mortgage/triumph-lending/44068646') } 

		it 'should raise an error' do
			expect{ bad_scraper }.to raise_error(RuntimeError, "Please enter a valid URL.")
		end

		it 'should parse the page' do
			expect(good_scraper).to be_a(ReviewScraper)
		end

		it 'should return the lender name' do
			expect(good_scraper).to be_a(ReviewScraper)
			lender = good_scraper.lender_name
			expect(lender).to eq('Triumph Lending')
		end

		it 'should return a review' do
			expect(good_scraper).to be_a(ReviewScraper)
			get_reviews = good_scraper.reviews[0]
			expect(get_reviews).to include({
				review_author: "Great experience ",
				review_body: "These folks are really kind and helpful in the whole process which they make simple. I would recommend anyone to them that need financial support ",
				review_author: "April from GROVERTOWN, IN ",
				review_date: "Reviewed in September 2019",
				star_count: "(5 of 5)"
			})
		end
	end
end
