
module Locomotive
  module LiquidExtensions
    module Tags

      class Floorplans < Solid::Block

        # register the tag
        tag_name :floorplans

        def display(options = {}, &block)
          
          #pry
          render_floorplans(&block)

        end

        protected

        def render_floorplans(&block)
          html = ''

          html
        end

      end
    end
  end
end
