# frozen_string_literal: true

class AddChildToChore < ActiveRecord::Migration[5.0]
  def change
    add_reference :chores, :child, foreign_key: true
  end
end
