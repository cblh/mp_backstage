class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :img_url
      t.string :content
      t.timestamps
    end
    add_index :resources, [:title, :created_at]
  end
end
