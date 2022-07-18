class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :postable, :postable_type, :postable_id

  belongs_to :user
  has_many :likes
  has_many :dislikes
  has_many :posts
end
