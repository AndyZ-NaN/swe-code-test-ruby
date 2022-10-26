These two scripts utilize the Selenium framework to access javascript-rendered webpages and download files from said webpages.

Script 1: codetest1.rb
Used to download a file https://codetest.services.mdxdata.com/. The link redirects to a login page, which the script recognizes and passes by clicking the 'Login' button. Usage: `ruby codetest1.rb <destination-dir>`

Script 2: codetest2.rb
Used to download JS-rendered json files available at https://codetest2.services.mdxdata.com/. The links to the files quickly expire and can cause a StaleElementReferenceError, so the exception must be caught and handled. Usage: `ruby codetest1.rb <destination-dir>`