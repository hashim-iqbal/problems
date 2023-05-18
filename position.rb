# I've built this model class to present how creation and deletion will work wheenver you perform any action.

class Item < ApplicationRecord
  validates :name, presence: true

  before_create :populate_position
  after_destroy :re_populate_position

  private

  # all the record with greater than deleted position will be decrement by 1. So, position will be balanced.
  def re_populate_position
    where('position > ?', self.position).update_all('position = position - 1')
  end

  # This will override if anyone pass any value of position and will set it to largest one.
  def populate_position
    self.position = Item.maximum(:position).to_i + 1
  end
end
