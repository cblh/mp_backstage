class ChangModelAtResource < ActiveRecord::Migration
  def change
	 	def up 
	    remove_column :resource, :model_id 
	  end 
	 
	  def down 
	    add_column :resource, :model, :references 
	  end 
  end
end
