class Group < ApplicationRecord
    has_many :group_members, dependent: :destroy
    has_many :notes, through: :group_members
    has_many :users, through: :group_members
    has_many :comments, through: :notes, through: :group_members
end
