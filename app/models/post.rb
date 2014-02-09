class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 25 }
  validates :content, presence: true, length: { maximum: 250 }
  validates_presence_of :author
end
