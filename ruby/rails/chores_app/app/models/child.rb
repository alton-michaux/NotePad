# frozen_string_literal: true

class Child < ApplicationRecord
  validates :name, presence: true
  validates :age,  presence: true
  validates :age, numericality: { only_integer: true }
  validates :chore, presence: false

  has_one :chore
end
