class AddEmbedCodeToPoems < ActiveRecord::Migration
  def change
    add_column :poems, :embed_code, :string
  end
end