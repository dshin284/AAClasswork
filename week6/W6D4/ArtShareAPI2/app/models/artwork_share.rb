class ArtworkShare < ApplicationRecord

   belongs_to : :user,
   primary_key: :id,
   foreign_key: :viewer_id,
   class_name: :User

   belongs_to : :artwork,
   primary_key: :id,
   foreign_key: :artwork_id,
   class_name: :Artwork
end