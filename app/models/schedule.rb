class Schedule < ApplicationRecord
  belongs_to :user
  has_many :items
  has_many :members

  with_options presence: true do
    validates :start_date
    validates :end_date
    validates :client
    validates :title
    validates :content
  end
end
