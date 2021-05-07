# frozen_string_literal: true

class AddChoreToChild < ActiveRecord::Migration[5.0]
  def change
    add_column :children, :job, :string
  end
end
