class LikeSerializer < ActiveModel::Serializer
  attributes :user_id, :post_id

  belongs_to :user
end
