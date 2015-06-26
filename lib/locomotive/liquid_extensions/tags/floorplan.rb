
module Locomotive
  module LiquidExtensions
    module Tags

      class Floorplan < Solid::Block

        # register the tag
        tag_name :floorplan

        def display(options = {}, &block)

          page_id = current_context.scopes.first['page']._id

          floorplan = Floorplan.where(page_id: page_id.to_s).first

          render_floorplan(floorplan, &block)


        end

        protected

        def render_floorplan(floorplan, &block)
          html = floorplan.image
          
          html
        end

      end
    end
  end
end
