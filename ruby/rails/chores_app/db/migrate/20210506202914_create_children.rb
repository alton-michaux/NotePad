# frozen_string_literal: true

class CreateChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :children do |t|
      t.string :name

      t.timestamps
    end
  end
end
