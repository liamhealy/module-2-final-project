class Group < ApplicationRecord
    has_many :group_members, dependent: :destroy
    has_many :notes, through: :group_members
    has_many :users, through: :group_members
    has_many :comments, through: :notes, through: :group_members

    validates :title, presence: true, uniqueness: true
    validates :theme, presence: true
    validates :description, presence: :true, length: { minimum: 20 }
end
