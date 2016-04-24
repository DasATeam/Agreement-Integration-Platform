class ChannelType < ActiveRecord::Base
	has_and_belongs_to_many(:documents, class_name: 'DocumentType', join_table: 'channel_types_document_types')
	has_one(:agreement_channel)
end
