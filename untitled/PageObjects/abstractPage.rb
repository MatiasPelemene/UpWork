require "selenium-webdriver"
require_relative '../PageObjects/home'

class AbstractPage
  @@driver = nil
  @@wait = Selenium::WebDriver::Wait.new(:timeout => 10)


  def initialize(driver)
   @@driver = driver
  end

  def navigateToAppRoot()
    @@driver.get("http://www.upwork.com")
    @@driver.manage.window.maximize

    return HomePage.new(@@driver)
  end

  def getTitle
    return @@driver.title
  end

  def quit
    @@driver.quit
  end

end

