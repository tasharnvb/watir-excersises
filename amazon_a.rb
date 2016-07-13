# Amazon (amazon_a.rb)
#
# 1. Search for the Ruby programming book on Amazon
# 2. Click on the first result
# 3. Verify if you're sent to the book's details page
# 4. Go back to the results
# 5. Click on the last result
# 6. Do step 3

require 'pry'
require 'watir-webdriver'

browser = Watir::Browser.new :chrome
browser.goto('https://www.amazon.co.uk/')
browser.text_field(id: 'twotabsearchtextbox').set('ruby programming book')
browser.button(class: 'nav-input').click
browser.li(id: 'result_0').a.click
browser.span(id: 'productTitle').wait_until_present
puts 'First result details page loaded correctly'
browser.a(id: 'breadcrumb-back-link').click
browser.li(id: 'result_15').a.click
browser.span(id: 'productTitle').wait_until_present
puts 'Last result details page loaded correctly'
puts 'Test finished, closing browser'
browser.close
