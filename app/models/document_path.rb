class DocumentPath < ActiveRecord::Base
  belongs_to(:merchant_documents)
end
