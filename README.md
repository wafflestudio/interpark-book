# Interpark::Book

Interpark에서 제공하는 도서 API를 루비 버전으로 묶은 gem입니다.

## Installation

Add this line to your application's Gemfile:

    gem 'interpark-book'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install interpark-book

## Usage

### Setup

	# config/initialize/interpark-book.rb
	
	require 'interpark/book'
	
	Interpark::Book.configure do |config|
		config.key = "인터파크 API 콘솔에서 발급 받은 키"
	end
	
### 기본 검색

	content = "삼국지"
	Interpark::Book::Search.content(query)
	
### 상세 검색
	content = "삼국지"
  options = {:query_type => "all"}
	Interpark::Book::Search.query(content, options)
	
### 다른 예제
	test.rb 참고
	
## Rails Example

[https://github.com/tantara/interpark-book-rails](https://github.com/tantara/interpark-book-rails)
	
	
## Contributing

1. Fork it ( http://github.com/<my-github-username>/interpark-book/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Contact

	1. Taekmin Kim (tantara.tm@gmail.com)
