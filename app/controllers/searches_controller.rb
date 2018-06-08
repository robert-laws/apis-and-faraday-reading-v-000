class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @res = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'HLJR0WFOHGRSSAIC5EQU1U0LKCXEQK3MXTTC1CSYQPCOND1N'
      req.params['client_secret'] = 'MOHY0WYVNQFCSGFMWLJIADFNU2CZIYRQEWKRDTMWEDNPTUYR'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end

    body_hash = JSON.parse(@res.body)
    @venues = body_hash['response']['venues']
    render 'search'
  end
end
