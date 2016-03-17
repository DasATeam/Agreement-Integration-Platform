class CreateChannelTypesDocumentTypes < ActiveRecord::Migration
  def change
    create_table :channel_types_document_types do |t|
    	t.references(:document_type, foreign_key: true, index: true)
    	t.references(:channel_type, foreign_key: true, index: true)
    end
  end
end
