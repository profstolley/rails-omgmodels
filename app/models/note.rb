class Note < ApplicationRecord
  validates :title, presence: true
  belongs_to :notebook
end
