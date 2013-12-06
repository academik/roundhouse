class CreatePoets < ActiveRecord::Migration
  def change
    create_table :poets do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :website
      t.text :bio
      t.string :facebook
      t.string :twitter

      t.timestamps
    end
  end
end
