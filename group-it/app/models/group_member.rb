class GroupMember < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :notes, dependent: :destroy
  has_many :comments, through: :notes

  def my_groups
    self.group
  end

  def my_group_names
    my_groups.title
  end
end
