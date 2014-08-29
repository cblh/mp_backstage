class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :keyword
      t.references :model
      t.references :resource

      t.timestamps
    end
  end
end
