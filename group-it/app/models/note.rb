class Note < ApplicationRecord
  belongs_to :group_member
  has_many :comments, dependent: :destroy
end
