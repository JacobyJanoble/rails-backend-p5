class LikeSerializer < ActiveModel::Serializer
  attributes :user_id, :post_id

  has_one :user
  has_one :post

  belongs_to :user
end
