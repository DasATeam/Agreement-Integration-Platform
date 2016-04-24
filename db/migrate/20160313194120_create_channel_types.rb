class CreateChannelTypes < ActiveRecord::Migration
  def change
    create_table :channel_types do |t|
      t.timestamps null: false
      t.string(:category)
      t.string(:name)
      t.string(:partner)
      t.string(:charge)
    end
  end
end
