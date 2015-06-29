
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
                byebug
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

# FB posts:

# {% facebook_posts account: 'cryptolottery', access_token: 'CAACEdEose0cBAAwIRHvYmoke8SZA159zZBME3xZAfdxNrUP25h5jn5NLV5s5yMSU822FyUqSLO525av5nbZC9ZAU3pofUOZAC1V3L8oZBTcWQnHebJynkMDZBPkSCvVcwAFPxZAdeJT0GuJEi2nw5vZBf4BJDCvx0wD8wh1OpmbqzRY08qkZCRE0FaddhDxYFYNTyZChfQGyFJZCs8JHNu9BrX8HUgDGlHTer4yYZD', limit: 10 %}
#     <li>
#       <a href="{{ facebook_post.link }}">{{ facebook_post.name }}</a>
#       <br/>
#       Posted on {{ facebook_post.created_time | date: "%a, %d %b %Y" }}
#     </li>
# {% endfacebook_posts %}