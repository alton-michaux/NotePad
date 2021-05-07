# frozen_string_literal: true

class AddAgeToChild < ActiveRecord::Migration[5.0]
  def change
    add_column :children, :age, :integer
  end
end
