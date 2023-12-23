class Message < ApplicationRecord
  before_save :set_created_time

  private

  def set_created_time
    self.created_time = Time.current.strftime('%Y-%m-%d %H:%M:%S')
  end
  
end
