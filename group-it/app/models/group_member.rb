class GroupMember < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :notes, dependent: :destroy
  has_many :comments, through: :notes
end
