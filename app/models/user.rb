class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :tasks
  has_many :created_tasks, class_name: "Task", foreign_key: :author_id

  validates :name, presence: true

  
end
