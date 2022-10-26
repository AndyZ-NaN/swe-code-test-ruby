#!/usr/bin/env ruby

require 'selenium-webdriver'

if ARGV.length < 1
    puts "Missing argument: <dest-dir>: " \
    "Destination directory for downloaded files."
    puts "Usage: ruby codetest2.rb <dest-dir>"
    exit
end

url = "https://codetest2.services.mdxdata.com"

options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])

download_path = ARGV[0]
download_prefs = {
    prompt_for_download: false,
    default_directory: download_path
}
options.add_preference(:download, download_prefs)

driver = Selenium::WebDriver.for(:chrome, options: options)
driver.manage.timeouts.implicit_wait = 1.0 / 24.0
driver.get(url)

begin
    driver.find_elements(:tag_name, "a").each do |element|
        element.click
    end
rescue
    # In case the try/catch fails due to the links 404-ing, refresh the page
    driver.get(url)
    driver.find_elements(:tag_name, "a").each do |element|
        element.click
    end
end

sleep(1) # Wait one second for downloads to finish before quitting

driver.quit