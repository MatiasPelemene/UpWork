require "selenium-webdriver"
require_relative '../PageObjects/home'
# The abstractPage class, contains the base methods
class AbstractPage
  @@driver = nil
  @@wait = Selenium::WebDriver::Wait.new(:timeout => 10)

  #Create an instance of WebDriver
  def initialize(driver)
   @@driver = driver
  end


  #navigateToAppRoot To get the url and open the browser
  def navigateToAppRoot()
    @@driver.get("http://www.upwork.com")
    @@driver.manage.window.maximize
    return HomePage.new(@@driver)
  end

  #Returns site's title
  def getTitle
    return @@driver.title
  end

  #quit Close the browser
  def quit
    @@driver.quit
  end

end

