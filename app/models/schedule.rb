class Schedule < ApplicationRecord
  belongs_to :user
  has_many :schedule_items
  has_many :items, through: :schedule_items
  has_many :members

  with_options presence: true do
    validates :start_date
    validates :end_date
    validates :client
    validates :title
    validates :content
    validates :items
  end

  # validate :uniqueness_of_same_day

  # def uniqueness_of_same_day
  #   # start_date = @schedule.start_date
  #   # end_date = @schedule.end_date
  #   if Schedule.joins(:schedule_items).exists?()
  #     errors.add(:start_date, "同じ日に使用できません")
  #     false
  #   else
  #     true
  #   end
  # end
end
