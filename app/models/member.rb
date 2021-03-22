class Member < ApplicationRecord
  has_many :schedule_members
  has_many :schedules, through: :schedule_members

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :name
  belongs_to_active_hash :position

  with_options presence: true do
    validates :name_id, numericality: { other_than: 0 }, uniqueness: true
    validates :position_id, numericality: { other_than: 0 }
  end
end
