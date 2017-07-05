# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User visit homepage', type: :feature do
  context 'successfully' do
    before { visit root_path }
    it 'shows welcome header' do
      expect(page).to have_css('h1', text: 'Welcome!')
    end
  end
end
