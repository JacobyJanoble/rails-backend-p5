class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :postable

  has_many :likes
  has_many :dislikes
end
