
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

        def render_photospheres(photospheres, &block)
          html = ''
          if photospheres

            photospheres.each do |photosphere|
              attributes = {image: photosphere.image_url, coordinates: photosphere.coordinates }
              current_context.stack do

                current_context.merge('photosphere' => attributes)
              
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
