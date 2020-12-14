require 'digest'
require 'httparty'

module Marvel
  class API
    def initialize(pub_key, private_key)
      @pub_key = pub_key
      @private_key = private_key
      @ts = Time.now.to_i
      @base_uri = "http://gateway.marvel.com"
    end

    def characters(offset, limit)
      url = "#{@base_uri}/v1/public/characters?"
      url+= "ts=#{@ts}"
      url+= "&apikey=#{@pub_key}"
      hash_md5 = ::Digest::MD5.hexdigest("#{@ts}#{@private_key}#{@pub_key}")
      url+= "&hash=#{hash_md5}&limit=#{limit}&offset=#{offset}"
      response = ::HTTParty.get(url)
      if response['code'] == 200
        JSON.parse(response.body)['data']
      else
        JSON.parse(response.body)
      end
    end

    def get_character(cid)
      url = "#{@base_uri}/v1/public/characters/#{cid}?"
      url+= "ts=#{@ts}"
      url+= "&apikey=#{@pub_key}"
      hash_md5 = ::Digest::MD5.hexdigest("#{@ts}#{@private_key}#{@pub_key}")
      url+= "&hash=#{hash_md5}"

      response = ::HTTParty.get(url)
      if response['code'] == 200
        JSON.parse(response.body)['data']
      else
        JSON.parse(response.body)
      end
    end
  end
end
