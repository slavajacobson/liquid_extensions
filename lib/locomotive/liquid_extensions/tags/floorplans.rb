
module Locomotive
  module LiquidExtensions
    module Tags

      class Floorplans < Solid::Block

        # register the tag
        tag_name :floorplans

        def display(options = {}, &block)

          page_id = current_context.scopes.first['page']._id

          floorplan = Floorplan.where(page_id: page_id.to_s).first

          render_floorplans(floorplan, &block)


        end

        protected

        def render_floorplans(floorplan, &block)
          html = 'Floorplan description: ' + floorplan.description

          html
        end

      end
    end
  end
end
