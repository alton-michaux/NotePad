# frozen_string_literal: true

class Chore < ApplicationRecord
  validates :job, presence: true
  validates :description, presence: true
  validates :child_id, numericality: { only_integer: true }
  validates_associated :child

  belongs_to :child
end
