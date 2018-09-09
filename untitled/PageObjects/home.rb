require_relative '../PageObjects/abstractPage'
require_relative '../PageObjects/result'
class HomePage < AbstractPage

  def initialize(driver)
    super(driver)
  end

  def performSearch(keyWord)
    @@driver.find_element(:name, 'q').send_keys(keyWord)
    @@wait.until { @@driver.find_element(:tag_name => "button") }
      element = @@driver.find_elements(:tag_name => "button")
      element[0].click
    sleep(5)
    return ResultsPage.new(@@driver)
  end


end