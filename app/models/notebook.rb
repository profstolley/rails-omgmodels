class Notebook < ApplicationRecord
  validates :title, presence: true
end
