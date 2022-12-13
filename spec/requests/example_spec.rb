# frozen_string_literal: true

require 'rails_helper'
require 'nokogiri'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'checking func', type: :system do
  scenario 'Register, login, calculate' do
    visit new_user_path
    fill_in :user_email, with: '123'
    fill_in :user_password, with: '123'
    fill_in :user_password_confirmation, with: '123'
    find('#submit-btn').click
    expect(current_path).to eq new_user_path

    visit root_path
    fill_in :email, with: '123'
    fill_in :password, with: '123'
    find('#submit-btn').click
    expect(current_path).to eq root_path

    fill_in :myParam, with: 25
    find('#submit-btn').click
    expect(current_path).to eq '/example/input'

    expect(find('#res').text.to_f).to be_within(5 - 0.001).of(5 + 0.001)
  end
end
# rubocop:enable Metrics/BlockLength
