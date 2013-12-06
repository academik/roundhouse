class AddTumblrYoutubeToPoets < ActiveRecord::Migration
  def change
  	add_column :poets, :tumblr, :string  
  	add_column :poets, :youtube, :string 
  end
end
