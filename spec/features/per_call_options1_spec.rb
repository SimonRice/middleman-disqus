require 'spec_helper'

describe 'per_call_options1', :type => :feature do
  before do
    visit '/per_call_options1.html'
  end

  it 'has the disqus thread element' do
    expect(page).to have_selector '#disqus_thread'
  end

  it 'has the disqus JS element set up' do
    expect(page.html).to include 'disqus.com/embed.js'
    expect(page.html).to include "var disqus_shortname = 'test-name'"
    expect(page.html).to include "var disqus_url = 'http://example.com/2012/the-best-day-of-my-life.html'"
    expect(page.html).to_not include 'var disqus_identifier'
    expect(page.html).to_not include 'var disqus_title'
    expect(page.html).to_not include 'var disqus_category_id'
    expect(page.html).to_not include 'var disqus_disable_mobile'
  end
end
