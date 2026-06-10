require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:userone) { User.create() }
  subject(:postone) { postone.posts.create() }
  it 'has many posts' do
        expect(userone.post).to be_present
  end

  it 'destroys dependent posts' do
    association = described_class.reflect_on_association(:posts)
    expect(association.with_options[:dependent]).to eq :destroy
  end
end
