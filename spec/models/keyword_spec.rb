require 'rails_helper'

RSpec.describe Keyword, type: :model do
  let!(:keyword) { create(:keyword) }

  it "有効な状態であること" do
    expect(keyword).to be_valid
  end
end
