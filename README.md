# Lender Reviews

* This service will work for all lenders located at this location `https://www.lendingtree.com/reviews`

* To run locally

	`rails server`

	use a url param ` ?url=(url for a lender)`

	Note: must be a web request in either http or https.

* There is no DB connected to this.

* Run tests 
	
	`rspec test/lib/review_scraper_test.rb` 

