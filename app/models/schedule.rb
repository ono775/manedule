class Schedule < ApplicationRecord
  belongs_to :user
  has_many :objects
  has_many :members

  with_options presence: true do
    validates :start_time
    validates :client
    validates :title
    validates :content
  end
end
