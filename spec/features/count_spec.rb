require 'spec_helper'

describe 'count', :type => :feature do
  before do
    visit '/count.html'
  end
  
  it 'has the disqus JS element set up' do
    expect(page.html).to include "var disqus_shortname = 'test-name'"
    expect(page.html).to include 'disqus.com/count.js'
  end
end
