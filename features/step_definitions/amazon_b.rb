# Amazon Intermediate (amazon_b.rb)
#
# 1. Go to Amazon
# 2. Search for Ruby
# 3. List out all the search results in the terminal (use the puts statement)
# Extra:
# 4. Format it this way: Number. Title - Price

When /^I try to output the results in the terminal$/ do
  puts 'Results:'
  # Get the books and loop through them (Each book is a list item)
  @browser.lis(class: 's-result-item celwidget').each_with_index do |book, index|
    # One of the list items is Shop by Category which is not a book so this loop ignores that item
    unless book.h2.text == 'Shop by Category'
      # Title of the book
      title = book.h2.text

      # The price of the book
      # The span element has multiple classes but s-price is unique to the price
      price = book.span(class: /s-price/).text

      puts "\n#{index + 1}. #{title} - #{price}"
    end
  end
end

Then /^the book titles appear in the terminal$/ do
  pending
end

# --------------------------------------------------------------------------
# Original Solution (Just using Watir)
#
# browser = Watir::Browser.new :chrome
# browser.goto('https://www.amazon.co.uk/')
# browser.text_field(id: 'twotabsearchtextbox').set('Ruby')
# browser.button(class: 'nav-input').click
#
# puts 'Results:'
# browser.ul(id: 's-results-list-atf').lis(class: 's-result-item celwidget').each_with_index do |book, index|
#   unless book.h2.text == 'Shop by Category'
#     puts "\n#{index + 1}. #{book.h2.text}"
#   end
# end
# browser.close
