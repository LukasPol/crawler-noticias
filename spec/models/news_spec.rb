require 'rails_helper'

RSpec.describe News, type: :model do
  let!(:news) { build(:news) }

  it 'should create a news' do
    expect do
      create(:news)
    end.to change(News, :count).by(1)
  end
end
