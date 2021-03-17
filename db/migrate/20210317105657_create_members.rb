class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.integer    :name_id,     null: false
      t.integer    :position_id, null: false
      t.references :schedule,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
