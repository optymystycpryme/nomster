class Place < ApplicationRecord
  WillPaginate.per_page = 5

  geocoded_by :address
  after_validation :geocode
  validates :name, presence: true, length: { maximum: 55, minimum: 2 }
  validates :address, presence: true
  validates :description, presence: true, length: { maximum: 500 }

  belongs_to :user
  has_many :photos
end
