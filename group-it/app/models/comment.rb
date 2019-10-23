class Comment < ApplicationRecord
  belongs_to :note
  has_one :group_member, through: :note
  has_one :group, through: :note, through: :group_member
  has_one :user, through: :note, through: :group_member
end
