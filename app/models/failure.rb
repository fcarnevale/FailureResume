# == Schema Information
#
# Table name: failures
#
#  id          :integer          not null, primary key
#  resume_id   :integer
#  description :string(255)
#  lesson      :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Failure < ActiveRecord::Base
  belongs_to :resume

  validates :description, presence: true, length: { maximum: 60 }
  validates :lesson, presence: true, length: { maximum: 400 }
end
