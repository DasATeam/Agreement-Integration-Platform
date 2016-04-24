class DocumentLink < ActiveRecord::Base
  belongs_to(:document_type)
end
