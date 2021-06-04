# frozen_string_literal: true

class AddChoreIdToChild < ActiveRecord::Migration[5.0]
  def change
    add_reference :children, :chore, foreign_key: true
  end
end
