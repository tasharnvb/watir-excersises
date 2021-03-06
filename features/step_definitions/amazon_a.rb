# Amazon (amazon_a.rb)
#
# 1. Search for the Ruby programming book on Amazon
# 2. Click on the first result
# 3. Verify if you're sent to the book's details page
# 4. Go back to the results
# 5. Click on the last result
# 6. Do step 3

Given /^I am on the amazon home page$/ do
  @browser.goto('https://www.amazon.co.uk/')
  @browser.div(id: 'gw-desktop-herotator').wait_until_present
end

And /^I search for (.+)$/ do |search_term|
  @browser.text_field(id: 'twotabsearchtextbox').set(search_term)
  @browser.button(class: 'nav-input').click
  @browser.div(id: 'atfResults').wait_until_present
end

When /^I click on the (.+) result$/ do |result_number|
  # Using this for the first result and last result scenarios
  if result_number == 'first'
    @browser.li(id: 'result_0').a.click
  elsif result_number == 'last'
    @browser.li(id: 'result_15').a.click
  end
end

Then /^I am sent to the book's details page$/ do
  @browser.span(id: 'productTitle').wait_until_present
end

Given /^I am on a book's details page$/ do
  @browser.button(class: 'nav-input').click
  @browser.li(id: 'result_0').a.click
  @browser.span(id: 'productTitle').wait_until_present
end

And /^I click back$/ do
  @browser.a(id: 'breadcrumb-back-link').click
end

Then /^I am returned to the results page$/ do
  @browser.div(id: 'atfResults').wait_until_present
end

# --------------------------------------------------------------------------
# Original Solution (Just using Watir)
#
# browser = Watir::Browser.new :chrome
# browser.goto('https://www.amazon.co.uk/')
#
# browser.text_field(id: 'twotabsearchtextbox').set('ruby programming book')
# browser.button(class: 'nav-input').click
#
# browser.li(id: 'result_0').a.click
# browser.span(id: 'productTitle').wait_until_present
# puts 'First result details page loaded correctly'
# browser.a(id: 'breadcrumb-back-link').click
# browser.li(id: 'result_15').a.click
# browser.span(id: 'productTitle').wait_until_present
# puts 'Last result details page loaded correctly'
# puts 'Test finished, closing browser'
# browser.close
