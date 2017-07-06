# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User visit homepage', type: :feature do
  context 'successfully' do
    before { visit root_path }
    it 'shows welcome header' do
      expect(page).to have_css('h1', text: 'Welcome!')
    end
    it 'shows Dashboard nav link' do
      expect(page).to have_css('a.nav-item.is-hidden-mobile', text: 'Dashboard')
    end
    it 'can visit Dashboard page' do
      click_link(class: 'is-hidden-mobile', text: 'Dashboard')
      expect(page).to have_css('h1', text: 'Dashboard')
    end
  end
end
