class Parking < ActiveRecord::Base
  self.table_name = "parking"

  validates :plate, presence: true
end 