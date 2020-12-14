require_relative "ruby_api/version"
require_relative "marvel/api"

module RubyApi
  # Collect all the Marvel characters using this method
  def self.characters(offset:0, limit:5)
    marvel = ::Marvel::API.new('8b2c5b7810c6ffd0ad183b2df0df0c54', YOUR_PRIVATE_KEY)
    marvel.characters(offset, limit)
  end

  # Get details about a character using character id received from above method
  def self.get_character(cid)
    marvel = ::Marvel::API.new('8b2c5b7810c6ffd0ad183b2df0df0c54', YOUR_PRIVATE_KEY)
    marvel.get_character(cid)
  end
end
