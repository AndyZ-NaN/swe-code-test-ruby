#!/usr/bin/env ruby

require 'selenium-webdriver'
url = 'https://codetest.services.mdxdata.com/'

download_prefs = {
    directory_upgrade: true,
    prompt_for_download: false,
    default_directory: 'C:\Users\Zhu\Documents\Code\github\ruby\downloads'
}

options = Selenium::WebDriver::Chrome::Options.new()
options.add_preference(:download, download_prefs)
driver = Selenium::WebDriver.for(:chrome, options: options)
driver.get(url)
driver.manage.timeouts.implicit_wait = 1
puts driver.current_url
if driver.current_url != url
    button = driver.find_element(:tag_name, "button")
    button.click
    driver.get(url)
end
    
dl = driver.find_element(:tag_name, "a")

dl.click
puts dl.attribute("href")

sleep(10)
driver.quit