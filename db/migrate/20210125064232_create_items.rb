class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer    :item_name_id,   null: false
      t.integer    :status_id, null: false
      t.references :user,      null: false, foreign_key: true
      t.references :schedule,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
