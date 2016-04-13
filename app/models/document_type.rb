class DocumentType < ActiveRecord::Base
	has_and_belongs_to_many(:channels, class_name: 'ChannelType', join_table: 'channel_types_document_types')
  has_one(:document_links)
end
