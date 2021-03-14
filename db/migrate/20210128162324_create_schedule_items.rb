class CreateScheduleItems < ActiveRecord::Migration[6.0]
  def change
    create_table :schedule_items do |t|
      t.integer :schedule_id
      t.integer :item_id
      t.timestamps
    end
  end
end
