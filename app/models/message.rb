class Message < ApplicationRecord
  before_create :set_created_time
  before_update :set_updated_time

  private

  def set_created_time
    self.created_time = Time.current.strftime('%Y-%m-%d %H:%M:%S')
  end

  def set_updated_time
    self.updated_time = Time.current
  end
end
