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

    describe 'GET job' do
      it 'renders the jobs view' do
        get example_show_path, params: { myParam: 25 }
        expect(response).to render_template('example/show')
      end
    end

    describe '/show' do
      context 'path' do
        it 'should return http success' do
          get example_show_path, params: { myParam: 25 }
          expect(response).to have_http_status(:success)
        end
      end
    end

    context 'error' do
      it 'nil par' do
        get example_show_path
        expect(response).to have_http_status(302)
      end

      it 'empty par' do
        get example_show_path, params: {}
        expect(response).to have_http_status(302)
      end
    end

    context 'norm' do
      it 'sqrt 25 = 5' do
        get example_show_path, params: { myParam: 25 }
        html = Nokogiri::HTML(response.body)
        div = html.search('td').last.text
        expect(div.to_f).to be_within(5 - 0.001).of(5 + 0.001)
      end

      it 'sqrt 64 = 8' do
        get example_show_path, params: { myParam: 64 }
        html = Nokogiri::HTML(response.body)
        div = html.search('td').last.text
        expect(div.to_f).to be_within(8 - 0.001).of(8 + 0.001)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
