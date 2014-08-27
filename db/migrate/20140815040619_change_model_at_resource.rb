class ChangeModelAtResource < ActiveRecord::Migration
  def change
    remove_column :resources, :model_id 
    add_column :resources, :model_id, :integer 


  end
end
