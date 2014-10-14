require 'spec_helper'
require 'watir'

describe "User posting text" do
	before(:all) do
		@browser = Watir::Browser.new :firefox
		@browser.goto "http://tumblr.com/login"
	end

	after(:all) do
		@browser.close
	end
    
    
it "can post a text post" do
#    @browser = Watir::Browser.new :firefox
#    @browser.goto "http://tumblr.com/login"

    @browser.text_field(:id, "signup_email").set "tgohil@testingcircle.com"
    @browser.text_field(:id, "signup_password").set "abcd1234"
    @browser.button(:id, "signup_forms_submit").click
    
    @browser.element(:id, "new_post_label_text").wait_until_present
    @browser.element(:id, "new_post_label_text").click
    
    sleep(3)
    @browser.send_keys("This is a test post")
    @browser.text_field(:name, "post[one]").set("Test Post Watir")
    
    sleep(3)
    #@browser.div(:id, "create_post").click
    @browser.button(:class, "create_post_button").click
    @browser.div(:class, "post_wrapper").wait_until_present

    if @browser.div(:class, "post_title").text == "Test Post Watir"
        puts "Success!"
    end
end

end