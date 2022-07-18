class ChannelMemberSerializer < ActiveModel::Serializer
  attributes :id, :channel_id

  belongs_to :user
end
