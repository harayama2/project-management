class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :confirmable

  enum :role, { member: 0, admin: 1 }

  has_many :owned_projects, class_name: "Project", foreign_key: "owner_id", dependent: :nullify
  has_many :owned_tasks, class_name: "Task", foreign_key: "owner_id", dependent: :nullify

  def full_name
    [ first_name, last_name ].compact.join(" ")
  end

  def display_name
    full_name.presence || email
  end
end
