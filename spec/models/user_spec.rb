require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:games) }

  it { is_expected.to validate_presence_of(:email) }
end

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           default(""), not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
