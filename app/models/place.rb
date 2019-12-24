class Place < ApplicationRecord
  WillPaginate.per_page = 5
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
end
