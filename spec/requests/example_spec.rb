# frozen_string_literal: true

require 'rails_helper'
require 'nokogiri'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Vichsl', type: :request do
  describe 'GET /input' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/example/show'
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'cheacking workable db' do
    i = rand(1..100)
    it 'new element adding' do
      expect(Vichsl.create(digit: i)).not_to be_nil
      expect(Vichsl.find_by(digit: i)).not_to be_nil
    end
  end

  describe 'diferent input and output values' do
    it 'not eq' do
      i = rand(1..100)
      t = Vichsl.create(digit: i)
      t1 = Vichsl.create(digit: i + 1)
      expect(t1).not_to eq(t)
    end
  end
end

RSpec.describe 'module testing', type: :model do
  it 'unique test' do
    Vichsl.create!(digit: 81)
    expect { Vichsl.create!(digit: 81) }.to raise_error ActiveRecord::RecordInvalid
  end
end
# rubocop:enable Metrics/BlockLength
