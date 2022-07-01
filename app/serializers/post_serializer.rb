class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :postable
end
