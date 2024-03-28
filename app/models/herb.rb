class Herb < ApplicationRecord
  validates :name, :watered, presence: true
end
