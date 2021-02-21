class Blog < ApplicationRecord
  validates :title, length: { minimum: 2 }
  validates :text,  length: { minimum: 2 }

  belongs_to :user
end
