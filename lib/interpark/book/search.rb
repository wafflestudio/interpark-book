module Interpark::Book
  class Search < Requirement
    class << self
      ### reference
      # http://book.interpark.com/bookPark/html/bookpinion/api_booksearch.html

      ### queryType
      # title(기본값) : 제목검색
      # author : 저자검색
      # publisher : 출판사검색
      # isbn : Isbn검색
      # productNumber : 상품번호
      # all : 제목, 저자, 출판사,ISBN 검색 대상

      ### searchTarget
      # book(기본값) : 국내도서
      # foreign : 외국도서
      # cd : 음반
      # dvd : DVD
      
      ### start
      # 1이상, 양의 정수(기본값:1)
      
      ### maxResults
      # 1이상 100이하, 양의 정수(기본값:10)
      
      ### sort
      # accuracy(기본값) : 정확도순
      # publishTime : 출간일
      # title : 제목
      # salesPoint : 판매량
      # customerRating : 고객평점
      # reviewCount : 리뷰갯수
      # price : 가격오름순
      # priceDesc : 가격내림순

      ### categoryId
      # 분야의 고유 번호(기본값:100 )
      
      ### output
      # xml(기본값) : REST XML형식
      # json : JSON방식
      
      ### inputEncoding
      # utf-8(기본값)
      # euc-kr
      
      ### adultImageExposure
      # n(기본값) : 노출안함
      # y : 노출함
      
      ### soldOut
      # y(기본값) : 품절/절판함께보기
      # n : 품절/절판빼고보기
    
      def query(content, options = {})
        query_type = options[:query_type].nil? ? "title" : options[:query_type]
        search_target = options[:search_target].nil? ? "book" : options[:search_target]
        start = options[:start].nil? ? 1 : options[:start]
        max_results = options[:max_results].nil? ? 10 : options[:max_results]
        sort = options[:sort].nil? ? "accuracy" : options[:sort]
        category_id = options[:category_id].nil? ? 100 : options[:category_id]
        output = options[:output].nil? ? "xml" : options[:output]
        input_encoding = options[:input_encoding].nil? ? "utf-8" : options[:input_encoding]
        adult_image_exposure = options[:adult_image_exposure].nil? ? "n" : options[:adult_image_exposure]
        sold_out = options[:sold_out].nil? ? "y" : options[:sold_out]

        res = client.search(content, {
          "queryType" => query_type,
          "searchTarget" => search_target,
          "start" => start,
          "maxResults" => max_results,
          "sort" => sort,
          "categoryId" => category_id,
#          "output" => output,
          "output" => "json",
          "inputEncoding" => input_encoding,
          "adultImageExposure" => adult_image_exposure,
          "soldOut" => sold_out,
        })
      end
    end
  end
end
