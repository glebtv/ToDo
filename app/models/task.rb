class Task < ActiveRecord::Base
  validates :name, :content, presence: true

  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_and_belongs_to_many :users

  default_scope { order('updated_at DESC') }
  scope :assigned, -> user{ joins(:users).where('users.id = ?',user)}
  scope :authored, -> user {where(author_id: user)}

  def visible_for(user)
    author == user || users.include?(user)
  end

end
