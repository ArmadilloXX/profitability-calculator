require 'rails_helper'

RSpec.feature "UserVisitHomepage", type: :feature do
  context 'successfully' do
    before { visit root_path }
    it 'shows welcome header'
  end
end
