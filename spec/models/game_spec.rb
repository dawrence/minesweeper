require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:board) }
  it { is_expected.to validate_presence_of(:number_of_mines) }
  it { is_expected.to validate_presence_of(:size) }
  it { is_expected.to validate_presence_of(:number_of_mines) }
end

# == Schema Information
#
# Table name: games
#
#  id              :bigint           not null, primary key
#  board           :json
#  ended           :boolean          default(FALSE)
#  number_of_mines :integer          default(1), not null
#  size            :integer          default(4), not null
#  started         :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer          not null
#
