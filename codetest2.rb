#!/usr/bin/env ruby

require 'selenium-webdriver'

# if ARGV.length != 2
#     puts "Downloads files available presented on"\
#         " https://codetest2.services.mdxdata.com"\
#         " into the current directory."
#     puts "Usage: ruby <script.rb> <url> <download path>"
#     exit
# end

url = "https://codetest2.services.mdxdata.com"
if ARGV[0] and Dir.exists?(ARGV[0])
    download_path = ARGV[0]
else
    download_path = "."
end


download_prefs = {
    prompt_for_download: false,
    default_directory: download_path
}

options = Selenium::WebDriver::Chrome::Options.new()
options.add_preference(:download, download_prefs)
driver = Selenium::WebDriver.for(:chrome, options: options)
driver.get(url)

driver.manage.timeouts.implicit_wait = 1

driver.find_elements(:tag_name, "a").each do |element|
    element.click
end

driver.quit