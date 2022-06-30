class CreateChannelOwners < ActiveRecord::Migration[7.0]
  def change
    create_table :channel_owners do |t|

      t.timestamps
    end
  end
end
