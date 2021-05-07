# frozen_string_literal: true

class AddDescriptionToChore < ActiveRecord::Migration[5.0]
  def change
    add_column :chores, :description, :text
  end
end
