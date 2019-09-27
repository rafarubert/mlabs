require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper

class Parking < ActiveRecord::Base
  self.table_name = "parking"

  validates :plate, presence: true

  validates :plate, format: { 
    with: /\A[A-Z]{3}-[0-9]{4}\z/, 
    message: "only valid plate" 
  }

  validates_each :left, on: :update do |record, attr, value|
    record.errors.add :left, 'permited only after paid' if record.paid == false
  end

  def time
    return distance_of_time_in_words(created_at, updated_at ) if left == true

    distance_of_time_in_words(created_at, Time.now)
  end

  def as_json(*)
    super.tap do |hash|
      hash["time"] = time
    end
  end

end 