class RemoveModelIdId < ActiveRecord::Migration
  def change
  	remove_column :resources, :model_id_id
  end
end
