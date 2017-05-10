class Interest < ActiveRecord::Base
  belongs_to :user_id
  validates :description, presence: true
end
