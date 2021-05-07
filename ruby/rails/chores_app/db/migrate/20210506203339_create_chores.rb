# frozen_string_literal: true

class CreateChores < ActiveRecord::Migration[5.0]
  def change
    create_table :chores do |t|
      t.string :job

      t.timestamps
    end
  end
end
