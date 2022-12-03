# frozen_string_literal: true

require 'rails_helper'
require 'nokogiri'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Examples', type: :request do
  describe 'GET /input' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe '/input' do
    context 'path' do
      it 'should return http success' do
        get root_path
        expect(response).to have_http_status(:success)
      end
    end

    context 'norm' do
      subject { post example_show_path, params: { myParam: 16 }, xhr: true }

      it 'should return http success' do
        subject
        html = Nokogiri::HTML(response.body)
        div = html.search('td').last.text
        expect(div.to_f).to be_within(8 - 0.001).of(8 + 0.001)
      end

      it 'should calculate correct result' do
        subject
        html = Nokogiri::HTML(response.body)
        div = html.search('td').last.text
        expect(div.to_f).to be_within(8 - 0.001).of(8 + 0.001)
      end
    end
  end

  describe 'Selenium WebDriver open root_path and' do
    before(:each) do
      @driver = Selenium::WebDriver.for :firefox
      @base_url = 'https://www.google.com/'
    end

    after(:each) do
      @driver.quit
    end

    it 'sqrt 64 ' do
      @driver.get('http://localhost:3000/')
      @driver.find_element(:id, 'myParam').click
      @driver.find_element(:id, 'myParam').clear
      @driver.find_element(:id, 'myParam').send_keys(64)
      @driver.find_element(:name, 'commit').click

      expect(@driver.find_element(:xpath, '/html/body/div/div/table/tbody/tr[6]/td[2]').text.to_f).to be_within(8 - 0.001).of(8 + 0.001)
    end

    it 'sqrt 64 ' do
      @driver.get('http://localhost:3000/')
      @driver.find_element(:id, 'myParam').click
      @driver.find_element(:id, 'myParam').clear
      @driver.find_element(:id, 'myParam').send_keys(64)
      @driver.find_element(:name, 'commit').click

      expect(@driver.find_element(:xpath, '//*[@id="col6"]').text.to_f).to be_within(8 - 0.001).of(8 + 0.001)
    end
  end
end
# rubocop:enable Metrics/BlockLength
