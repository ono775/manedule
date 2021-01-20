class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.date       :location_date, null: false
      t.string     :client,        null: false
      t.string     :title,         null: false
      t.text       :content,       null: false
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
