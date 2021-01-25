class Item < ApplicationRecord
  belongs_to :user
  belongs_to :schedule

  with_options presence: true do
    validates :item_name_id
    validates :status_id
  end
end
