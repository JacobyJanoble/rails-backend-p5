class ChannelMemberSerializer < ActiveModel::Serializer
  attributes :channel_id, :user_id

  belongs_to :user
  belongs_to :channel
end
