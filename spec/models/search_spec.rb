require 'rails_helper'

RSpec.describe Search, type: :model do
  it 'is valid with valid attributes' do
    search = Search.new(query: 'Valid query', ip_address: '127.0.0.1')
    expect(search).to be_valid
  end

  it 'is not valid with a short query' do
    search = Search.new(query: '1234', ip_address: '127.0.0.1')
    expect(search).not_to be_valid
  end
end
