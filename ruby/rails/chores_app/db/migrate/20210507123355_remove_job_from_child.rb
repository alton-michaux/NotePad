# frozen_string_literal: true

class RemoveJobFromChild < ActiveRecord::Migration[5.0]
  def change
    remove_column :children, :job, :string
  end
end
