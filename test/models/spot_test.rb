# == Schema Information
#
# Table name: spots
#
#  id            :bigint(8)        not null, primary key
#  host_id       :integer          not null
#  name          :string           not null
#  accommodation :string           not null
#  rate          :integer          not null
#  num_guests    :integer          not null
#  num_beds      :integer          not null
#  num_baths     :integer          not null
#  img_url       :string
#  description   :text
#  city          :string           not null
#  address       :string           not null
#  lat           :float            not null
#  lng           :float            not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  ave_rating    :integer
#

require 'test_helper'

class SpotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
