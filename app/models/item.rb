class Item < ApplicationRecord
  belongs_to :user
  has_many :schedule_items
  has_many :schedules, through: :schedule_items

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_name
  belongs_to_active_hash :status

  with_options presence: true do
    validates :item_name_id, numericality: { other_than: 0 }, uniqueness: true
    validates :status_id, numericality: { other_than: 0 }
  end
end
