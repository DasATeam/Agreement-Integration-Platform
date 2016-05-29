# == Schema Information
#
# Table name: points
#
#  id         :integer          not null, primary key
#  isi        :string
#  nomor      :string
#  point_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Point < ActiveRecord::Base
  # belongs_to: pasal
  has_many :points
end
