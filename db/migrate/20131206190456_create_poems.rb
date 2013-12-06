class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.integer :venue_id
      t.integer :organization_id
      t.string :title
      t.date :date
      t.text :text
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
