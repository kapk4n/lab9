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

  # def to_path(path)
  #   visit path
  #   expect(current_path).to eq session_login_path
  # end

  # scenario 'Check without register' do
  #   User.create(username: 'NotHim', password_digest: 'Pass')
  #   routes = ['/users/1', '/users/1/edit', '/index/output', root_path, '/users']
  #   routes.each do |path|
  #     to_path(path)
  #   end
  # end
end
# rubocop:enable Metrics/BlockLength
