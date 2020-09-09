# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  image_url  :integer          not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#
class Artwork < ApplicationRecord
      belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

      has_many :artworkshares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare
end
