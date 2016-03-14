class CreateAgreementChannels < ActiveRecord::Migration
  def change
    create_table :agreement_channels do |t|
      t.timestamps null: false
      t.references(:agreement, foreign_key: true)
      t.references(:channel_type, foreign_key: true)
      t.string(:customprice)
    end
  end
end
