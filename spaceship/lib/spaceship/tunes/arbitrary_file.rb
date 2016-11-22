module Spaceship
  module Tunes
    # Represents an arbitrary file
    class ArbitraryFile < TunesBase
      attr_accessor :asset_token

      attr_accessor :file_type

      attr_accessor :name

      attr_accessor :time_stamp

      attr_accessor :url

      attr_mapping(
        'assetToken' => :asset_token,
        'timeStamp' => :time_stamp,
        'url' => :url,
        'name' => :name,
        'file_type' => :file_type
      )

      class << self
        def factory(attrs)
          self.new(attrs)
        end
      end
    end
  end
end
