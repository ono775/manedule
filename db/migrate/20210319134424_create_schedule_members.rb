class CreateScheduleMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :schedule_members do |t|
      t.integer :schedule_id
      t.integer :member_id
      t.timestamps
    end
  end
end
