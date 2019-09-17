# Lender Reviews

This web service will give you back the user reviews for different loans from Lendingtree in the form of JSON.

* To run locally

`rails server`

use a url param ` ?url=(url for a lender)`

Note: must be a web request in either http or https.

* There is no DB connected to this.

* Run tests 
	
`rspec test/lib/review_scraper_test.rb` 

