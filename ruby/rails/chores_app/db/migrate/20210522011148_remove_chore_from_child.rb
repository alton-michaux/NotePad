# frozen_string_literal: true

class RemoveChoreFromChild < ActiveRecord::Migration[5.0]
  def change
    remove_column :children, :chore, :string
  end
end
