class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image_url

  has_many :channel_members
  has_many :channel_owners

end
