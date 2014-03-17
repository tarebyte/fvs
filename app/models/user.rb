require 'elasticsearch/model'

class User < ActiveRecord::Base
  extend FriendlyId
    friendly_id :slugged_candidates, use: :slugged

  def slugged_candidates
    [
      :name,
      [:name, :id]
    ]
  end

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name BONSAI_INDEX_NAME

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, foreign_key: :author_id
  validates :name, :slug, presence: true
end
