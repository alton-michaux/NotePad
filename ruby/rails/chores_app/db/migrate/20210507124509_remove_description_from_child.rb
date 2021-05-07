class RemoveDescriptionFromChild < ActiveRecord::Migration[5.0]
  def change
    remove_column :children, :description, :text
  end
end
