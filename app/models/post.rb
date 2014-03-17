require 'elasticsearch/model'

class Post < ActiveRecord::Base
  extend FriendlyId
    friendly_id :slugged_candidates, use: :slugged

  def slugged_candidates
    [
      :title,
      :title_and_author,
      [:title_and_author, :id]
    ]
  end

  def title_and_author
    "#{title} #{author.name}"
  end
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name BONSAI_INDEX_NAME

  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 25 }
  validates :content, presence: true, length: { maximum: 250 }
  validates_presence_of :author
end
