class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :description
      t.string :location
      t.datetime :date
      t.integer :creator_id

      t.timestamps
    end
  end
end
