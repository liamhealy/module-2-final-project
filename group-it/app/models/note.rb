class Note < ApplicationRecord
  belongs_to :group_member
  has_one :group, through: :group_member
  has_many :comments, dependent: :destroy

  # def groups
  #   self.group_member.map do |group_member|
  #     group_member.group
  #   end
  # end
end
