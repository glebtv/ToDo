class Task < ActiveRecord::Base
  validates :name, :content, presence: true

  belongs_to :user

  default_scope { order('updated_at DESC') }


end
