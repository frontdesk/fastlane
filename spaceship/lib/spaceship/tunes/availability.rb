module Spaceship
  module Tunes
    class Availability < TunesBase
      # @return (Bool) Are future territories included?
      attr_accessor :include_future_territories

      # @return (Array of Spaceship::Tunes::Territory objects) A list of the territories
      attr_accessor :territories

      attr_mapping(
        'theWorld' => :include_future_territories
      )

      class << self
        # Create a new object based on a hash.
        # This is used to create a new object based on the server response.
        def factory(attrs)
          obj = self.new(attrs)
          obj.unfold_territories(attrs['countries'])
          return obj
        end
      end

      def unfold_territories(attrs)
        unfolded_territories = attrs.map { |info| Territory.new(info) }
        instance_variable_set(:@territories, unfolded_territories)
      end
    end
  end
end
