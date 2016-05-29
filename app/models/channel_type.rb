# == Schema Information
#
# Table name: channel_types
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  category   :string
#  name       :string
#  partner    :string
#  charge     :string
#

class ChannelType < ActiveRecord::Base
	has_and_belongs_to_many(:documents, class_name: 'DocumentType', join_table: 'channel_types_document_types')
	has_one(:agreement_channel)
end
