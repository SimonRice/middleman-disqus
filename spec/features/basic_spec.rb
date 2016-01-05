require 'spec_helper'

describe 'basic', :type => :feature do
  before do
    visit '/basic.html'
  end

  it 'has the disqus thread element' do
    expect(page).to have_selector '#disqus_thread'
  end

  it 'has the disqus JS element set up' do
    expect(page.html).to include "var disqus_shortname = 'test-name'"
    expect(page.html).to include 'disqus.com/embed.js'
  end
end
