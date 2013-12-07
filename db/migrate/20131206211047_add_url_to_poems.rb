class AddUrlToPoems < ActiveRecord::Migration
  def change
  	add_column :poems, :link, :string
  end
end
