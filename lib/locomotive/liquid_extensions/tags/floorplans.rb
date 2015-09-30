
module Locomotive
  module LiquidExtensions
    module Tags

      class Floorplans < Solid::Block

        # register the tag
        tag_name :floorplans

        def display(options = {}, &block)
          
          page_id = options[:page].id #current_context.scopes.last['page']._id
          thumb = options[:thumb]

          floorplan = Floorplan.where(page_id: page_id.to_s).first

          render_floorplan(floorplan, thumb, &block)


        end

        protected

        def render_floorplan(floorplan, thumb, &block)
          if floorplan.present?
            if thumb
              html = floorplan.image_url(:thumb)
            else
              html = floorplan.image
            end
          end

          html
        end

      end
    end
  end
end
