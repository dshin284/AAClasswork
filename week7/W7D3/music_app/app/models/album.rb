# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  band_id    :integer          not null
#  studio     :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
    validates :title, :year, :band_id, :studio, presence: true
    validates :title, uniqueness: {scope: :band_id}
    validates :studio, inclusion: { in: [true, false] }
    validates :year, numerically: {minimum: 1800, maximum: 9000}



    belongs_to :bands,
        primary_key: :id,
        foreign_key: :band_id,
        class_name: :Band
end
