class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :password_digest, :image_url

  has_many :likes
  has_many :dislikes
  has_many :posts

end
