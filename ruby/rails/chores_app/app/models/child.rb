# frozen_string_literal: true

class Child < ApplicationRecord
  validates :name, presence: true
  validates :age,  presence: true
  validates :age, numericality: { only_integer: true }

  has_many :chores
end
