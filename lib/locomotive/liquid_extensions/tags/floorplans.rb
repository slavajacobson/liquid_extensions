
module Locomotive
  module LiquidExtensions
    module Tags

      class Floorplans < Solid::Block

        # register the tag
        tag_name :floorplans

        def display(options = {}, &block)

          page_id = current_context.scopes.first['page']._id
          
          floorplan = Floorplan.where(page_id: page_id.to_s).first

          render_floorplan(floorplan, &block)


        end

        protected

        def render_floorplan(floorplan, &block)
          if floorplan.present?
            html = floorplan.image
          end

          html
        end

      end
    end
  end
end
