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

    # describe 'GET job' do
    #   it 'renders the jobs view' do
    #     get example_show_path, params: { myParam: 25 }
    #     expect(response).to render_template('example/show')
    #   end
    # end

    # describe '/show' do
    #   context 'path' do
    #     it 'should return http success' do
    #       get example_show_path, params: { myParam: 25 }
    #       expect(response).to have_http_status(:success)
    #     end
    #   end
    # end

    # context 'error' do
    #   it 'nil par' do
    #     get example_show_path
    #     expect(response).to have_http_status(302)
    #   end

    #   it 'empty par' do
    #     get example_show_path, params: {}
    #     expect(response).to have_http_status(302)
    #   end
    # end

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

  # describe 'Capybara test case', type: :feature do
  #   context 'Capybara test case' do
  #     it 'body should contain header' do
  #       visit root_path
  #       expect(page).to have_content 'example'
  #     end
  #   end
  # end

  describe 'Selenium WebDriver open root_path and' do
    before(:each) do
      @driver = Selenium::WebDriver.for :chrome
      @base_url = 'https://www.google.com/'
      # @vars = {}
    end

    after(:each) do
      @driver.quit
    end

    # it 'send n = 1568l body should contain error' do
    #   @driver.get 'http://localhost:3000/'
    #   @driver.find_element(:id, 'myParam').click
    #   @driver.find_element(:id, 'myParam').clear
    #   @driver.find_element(:id, 'myParam').send_keys '16'
    #   @driver.find_element(:name, 'commit').click

    #   expect(@driver.find_element(:xpath, '//div[@id=\'result\']/div').text).to eq('Error: Incorrect params\'1568l\'')
    # end

    # it 'params are empty body should contain error' do
    #   @driver.get 'http://localhost:3000/'
    #   @driver.find_element(:id, 'n').click
    #   @driver.find_element(:id, 'n').clear
    #   @driver.find_element(:name, 'commit').click

    #   expect(@driver.find_element(:xpath, '//div[@id=\'result\']/div').text).to eq('Error: Empty params')
    # end

    # it 'send default params body should contain ' do
    #   @driver.get 'http://localhost:3000/'
    #   @driver.find_element(:id, 'n').click
    #   @driver.find_element(:name, 'commit').click

    #   expect(@driver.find_element(:css, '.row:nth-child(13) > .col-6').text).to eq('1234321')
    # end

    it 'n = 145 body should contain 14641' do
      @driver.get('http://localhost:3000/')
      @driver.find_element(:id, 'myParam').click
      @driver.find_element(:id, 'myParam').clear
      @driver.find_element(:id, 'myParam').send_keys('64')
      @driver.find_element(:name, 'commit').click

      expect(@driver.find_element(:xpath, '//*[@id="result_container"]/div/table/tbody/tr[5]/td[2]').to_f).to be_within(8 - 0.001).of(8 + 0.001)
    end

    # it 'After errors body should contain result' do
    #   @driver.get('http://localhost:3000/')
    #   @driver.find_element(:id, 'n').click
    #   @driver.find_element(:id, 'n').clear
    #   @driver.find_element(:id, 'n').send_keys('122')
    #   @driver.find_element(:name, 'commit').click

    #   @driver.find_element(:id, 'n').click
    #   @driver.find_element(:id, 'n').clear
    #   @driver.find_element(:id, 'n').send_keys('')
    #   @driver.find_element(:name, 'commit').click

    #   @driver.find_element(:id, 'n').click
    #   @driver.find_element(:id, 'n').clear
    #   @driver.find_element(:id, 'n').send_keys('s')
    #   @driver.find_element(:name, 'commit').click

    #   @driver.find_element(:id, 'n').click
    #   @driver.find_element(:id, 'n').clear
    #   @driver.find_element(:id, 'n').send_keys('500')
    #   @driver.find_element(:name, 'commit').click

    #   expect(@driver.find_element(:css, '.row:nth-child(11) > .col-6').text).to eq('44944')
    # end
  end
end
# rubocop:enable Metrics/BlockLength
