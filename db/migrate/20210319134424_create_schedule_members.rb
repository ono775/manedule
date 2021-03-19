class CreateScheduleMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :schedule_members do |t|

      t.timestamps
    end
  end
end
