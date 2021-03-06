require 'rails_helper'
require 'support/capybara'

RSpec.feature 'User visit homepage', type: :feature, js: true do
  context 'successfully' do
    before { visit root_path }
    it 'shows welcome header' do
      expect(page).to have_css('h1', text: 'Welcome!')
    end
    it 'shows Dashboard nav link' do
      expect(page).to have_css('a.nav-item.is-hidden-mobile',
                               text: 'Calculator')
    end
    it 'can visit Dashboard page' do
      click_link(class: 'is-hidden-mobile', text: 'Calculator')
      expect(page).to have_css('h2', text: 'Real profitability rate')
    end
  end
end
