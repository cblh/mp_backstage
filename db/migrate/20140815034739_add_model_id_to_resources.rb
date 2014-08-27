class AddModelIdToResources < ActiveRecord::Migration
  def change
    add_reference :resources, :model, index: true
  end
end
