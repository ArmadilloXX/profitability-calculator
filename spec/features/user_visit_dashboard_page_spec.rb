require 'rails_helper'

RSpec.feature 'User visit dashboard page', type: :feature do
  context 'successfully' do
    before { visit dashboard_path }
    it 'shows Dashboard header' do
      expect(page).to have_css('h1', text: 'Dashboard')
    end
  end
end
