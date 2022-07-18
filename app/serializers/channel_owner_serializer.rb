class ChannelOwnerSerializer < ActiveModel::Serializer
  attributes :id, :channel_id

  belongs_to :channel
end
