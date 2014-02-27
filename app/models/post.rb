class Post < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 25 }
  validates :content, presence: true, length: { maximum: 250 }
  validates_presence_of :author
end
