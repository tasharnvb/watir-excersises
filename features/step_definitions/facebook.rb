# Facebook (facebook.rb)
#
# 1. Go to the Facebook homepage
# 2. Login using your credentials
# 3. Verify if you were logged in
# 4. Go to your profile page
# 5. Verify if you're in your profile page

Given /^I am on the facebook home page$/ do
  @browser.goto('https://www.facebook.com/')
  @browser.div(id: 'registration_container').wait_until_present
end

When /^I enter my details and click login$/ do
  @browser.text_field(id: 'email').set('teamhero@tiscali.co.uk')
  @browser.text_field(id: 'pass').set('devante1')
  @browser.button(value: 'Log In').click
end

Then /^I am logged in$/ do
  @browser.textarea(title: 'What\'s on your mind?').wait_until_present
end

When /^I try to go my profile page$/ do
  # binding.pry

  # Chrome's alert box comes up to ask about notifications
  # This loop makes sure that it disappears (by clicking it)
  if @browser.div(class: '_3ixn').exists?
    while @browser.div(class: '_3ixn').exists?
      @browser.div(class: '_3ixn').click
    end
  end

  # binding.pry
  @browser.div(id: 'pagelet_bluebar').a(href: 'https://www.facebook.com/tasharn.vidalbrown').click
end

Then /^I am sent to my profile page$/ do
  @browser.div(class: 'coverBorder').wait_until_present
end

# --------------------------------------------------------------------------
# Original Solution (Just using Watir)
#
# browser = Watir::Browser.new :chrome
# browser.goto('https://en-gb.facebook.com/')
#
# browser.text_field(id: 'email').set('teamhero@tiscali.co.uk')
# browser.text_field(id: 'pass').set('devante1')
# browser.button(value: 'Log In').click
#
# browser.textarea(title: 'What\'s on your mind?').wait_until_present
# puts 'Login successful'
#
# # An alert shows up to ask about allowing notifications
# # Alert is not showing up before it checks for it
# # if browser.alert.exists?
# #   browser.alert.close
# # end
#
# # This works (for some reason)
# if browser.div(class: '_3ixn').exists?
#   browser.div(class: '_3ixn').click
# end
#
# browser.div(id: 'pagelet_bluebar').a(href: 'https://www.facebook.com/tasharn.vidalbrown').click
# raise unless browser.url == 'https://www.facebook.com/tasharn.vidalbrown'
# puts 'Successfully went to the profile page'
#
# browser.close
