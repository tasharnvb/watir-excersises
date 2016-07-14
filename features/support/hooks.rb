browser = Watir::Browser.new :chrome

Before do |scenario|
  # ||= means that if @browser is null, then set it to browser. Otherwise, keep the value of @browser
  @browser ||= browser
end

at_exit do
  browser.close
end
