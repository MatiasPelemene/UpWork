require "yaml"
require "selenium-webdriver"
require_relative '../PageObjects/home'


# The abstractPage class, contains the base methods
class AbstractPage
  @@driver = nil
  @@wait = Selenium::WebDriver::Wait.new(:timeout => 60)

   @@configuration = YAML::load_file(("./sources/config.yaml"))

  #Create an instance of WebDriver
  def initialize(driver)
   @@driver = driver
  end


  #navigateToAppRoot To get the url and open the browser
  def navigateToAppRoot()
    @@driver.get(@@configuration['configuration']['url'])
    @@driver.manage().delete_all_cookies()
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

