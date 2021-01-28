class CreateScheduleItems < ActiveRecord::Migration[6.0]
  def change
    create_table :schedule_items do |t|

      t.timestamps
    end
  end
end
