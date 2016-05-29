# == Schema Information
#
# Table name: document_types
#
#  id            :integer          not null, primary key
#  name          :string
#  is_additional :boolean
#

class DocumentType < ActiveRecord::Base
	has_and_belongs_to_many(:channels, class_name: 'ChannelType', join_table: 'channel_types_document_types')
  has_one(:document_link)

  def link
    return self.document_link.link
  end

end
