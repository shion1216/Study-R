class Calendar < ApplicationRecord
  validates :target_time,presence: true
  validates :work_content,presence: true
  validates :user_id,presence: true
  
  belongs_to :user
  
end