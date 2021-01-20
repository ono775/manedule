class Schedule < ApplicationRecord
  belongs_to :user
  has_manny :objects
  has_manny :members

  with_options presence: true do
    validates :location_date
    validates :client
    validates :title
    validates :content
  end
end
