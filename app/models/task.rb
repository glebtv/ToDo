class Task < ActiveRecord::Base
  validates :name, :content, presence: true

  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_and_belongs_to_many :users

  default_scope { order('updated_at DESC') }

end
