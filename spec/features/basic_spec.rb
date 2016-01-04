require 'spec_helper'

describe 'basic', :type => :feature do
  before do
    visit '/basic.html'
  end

  it 'has the disqus thread element', js: true do
    expect(page).to have_selector '#disqus_thread'
  end
end
