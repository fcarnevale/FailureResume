# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :failures

  accepts_nested_attributes_for :failures

  def to_param
    user.twitter_handle
  end
end
