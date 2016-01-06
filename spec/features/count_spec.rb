require 'spec_helper'

describe 'count', :type => :feature do
  before do
    visit '/count.html'
  end

  it 'has the disqus JS element set up' do
    expect(page.html).to include "var disqus_shortname = 'test-name'"
    expect(page.html).to include 'disqus.com/count.js'
    expect(page.html).to_not include 'var disqus_identifier'
    expect(page.html).to_not include 'var disqus_title'
    expect(page.html).to_not include 'var disqus_url'
    expect(page.html).to_not include 'var disqus_category_id'
    expect(page.html).to_not include 'var disqus_disable_mobile'
  end
end
