# Amazon Intermediate (amazon_b.rb)
#
# 1. Go to Amazon
# 2. Search for Ruby
# 3. List out all the search results in the terminal (use the puts statement)

require 'pry'
require 'watir-webdriver'

browser = Watir::Browser.new :chrome
browser.goto('https://www.amazon.co.uk/')
browser.text_field(id: 'twotabsearchtextbox').set('Ruby')
browser.button(class: 'nav-input').click

puts 'Results:'
browser.ul(id: 's-results-list-atf').lis(class: 's-result-item celwidget').each_with_index do |result_item, index|
  unless result_item.h2.text == 'Shop by Category'
    puts "\n#{index + 1}. #{result_item.h2.text}"
  end
end
browser.close
