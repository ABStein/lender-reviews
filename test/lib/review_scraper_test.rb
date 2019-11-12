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
				review_title: "It was a good experience ",
				review_body: "Never heard of Network funding or triumph lending compare to big banks and credit unions out there. I was afraid if I was wasting my time to apply with them. So I was shopping around mortgage rates with 4 different lenders thru online and the app. Network Funding were the only mortgage company popped up on my lending trees app. My lender agent was Peter Lammerts. He contacted me right away thru the email when he got my request. He was very helpful and friendly, he answered all kind of questions that I asked. Working with network funding had been very smooth and easy to understand. They process documents right away when you upload the files online. Everything was promised as it was. My interest rate was 3.625% 30 years fixed. I was very happy that I closed the house with network funding . Hey! hey! hey! For those of you with big money in the market seeking for mortgage . Give them a try, you will never get disappointed. Thank you for being exist in this world. ",
				review_author: "Jinyang from SAN ANTONIO, TX ",
				review_date: "Reviewed in October 2019",
				star_count: "(5 of 5)stars"
			})
		end
	end
end
