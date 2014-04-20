# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  twitter_handle   :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  provider         :string(255)
#  uid              :string(255)
#  name             :string(255)
#  oauth_token      :string(255)
#  oauth_expires_at :datetime
#

class User < ActiveRecord::Base
  has_one :resume
  has_many :failures, through: :resume

  accepts_nested_attributes_for :resume

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.twitter_handle = auth["info"]["nickname"]
      user.oauth_token = auth["credentials"]["token"]
      user.save!
    end
  end
end
