class DeleteDuplicate < ApplicationRecord
  
  # subquery will find out all the latest created records of every name. And later on we'll destroy all ther records  other than them.
  def duplicate_destroy
    DeleteDuplicate.where.not(id: DeleteDuplicate.select('MAX(id)').group(:name).pluck('MAX(id)')).delete_all
  end
end
