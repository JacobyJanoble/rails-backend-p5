class CreateChannelMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :channel_members do |t|

      t.timestamps
    end
  end
end
