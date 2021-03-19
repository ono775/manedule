class Member < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :name
  belongs_to_active_hash :position
end
