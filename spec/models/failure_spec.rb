# == Schema Information
#
# Table name: failures
#
#  id          :integer          not null, primary key
#  resume_id   :integer
#  description :string(255)
#  lesson      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Failure do
  pending "add some examples to (or delete) #{__FILE__}"
end
