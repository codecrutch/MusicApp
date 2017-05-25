# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  lyrics     :text
#  created_at :datetime
#  updated_at :datetime
#  album_id   :integer          not null
#

class Track < ActiveRecord::Base
  validates :name, :album, presence: true

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Album
end
