require 'elasticsearch/model'

class Post < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name BONSAI_INDEX_NAME

  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 25 }
  validates :content, presence: true, length: { maximum: 250 }
  validates_presence_of :author
end
