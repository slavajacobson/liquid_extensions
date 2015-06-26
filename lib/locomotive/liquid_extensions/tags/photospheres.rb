
module Locomotive
  module LiquidExtensions
    module Tags

      class Photospheres < Solid::Block

        # register the tag
        tag_name :photospheres

        def display(options = {}, &block)

          page_id = current_context.scopes.first['page']._id

          photospheres = Floorplan.where(page_id: page_id.to_s).first.photospheres

          render_photospheres(photospheres, &block)


        end

        protected

        def render_floorplan(photospheres, &block)
          html = []
          if photospheres
            photospheres.each do |photosphere|
              

              current_context.stack do
                current_context.merge('facebook_post' => attributes)

                html << yield
              end

            end
          end
          html
        end

      end
    end
  end
end
