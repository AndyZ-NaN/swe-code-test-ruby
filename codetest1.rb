#!/usr/bin/env ruby

require 'selenium-webdriver'

if ARGV.length < 1
    puts "Missing argument: <dest-dir>: " \
    "Destination directory for downloaded files."
    puts "Usage: ruby codetest1.rb <dest-dir>"
    exit
end

url = 'https://codetest.services.mdxdata.com/'

download_path = ARGV[0]
download_prefs = {
    prompt_for_download: false,
    default_directory: download_path
}

options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
options.add_preference(:download, download_prefs)
driver = Selenium::WebDriver.for(:chrome, options: options)
driver.manage.timeouts.implicit_wait = 1
driver.get(url)

if driver.current_url != url
    button = driver.find_element(:tag_name, "button")
    button.click
    driver.get(url)
end
    
begin
    element = driver.find_element(:tag_name, "a")
    element.click
rescue
    driver.get(url)
    element = driver.find_element(:tag_name, "a")
    element.click
end

sleep(1)

driver.quit