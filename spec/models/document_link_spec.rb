# == Schema Information
#
# Table name: document_links
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  document_type_id :integer
#  link             :string
#

require 'rails_helper'

RSpec.describe DocumentLink, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
