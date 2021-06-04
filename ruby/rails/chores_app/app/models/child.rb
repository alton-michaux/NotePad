# frozen_string_literal: true

class Child < ApplicationRecord
  validates :name, presence: true
  validates :age,  presence: true
  validates :age, numericality: { only_integer: true }
  validates :id, presence: true
  validates :chore_id, presence: false

  has_many :chores
end
