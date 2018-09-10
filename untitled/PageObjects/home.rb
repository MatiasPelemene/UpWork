require_relative '../PageObjects/abstractPage'
require_relative '../PageObjects/result'
class HomePage < AbstractPage

  def initialize(driver)
    super(driver)
  end

  def performSearch(keyWord)
    @@wait.until { @@driver.find_element(:css => "span.glyphicon.air-icon-arrow-expand") }
    element = @@driver.find_element(:css => "span.glyphicon.air-icon-arrow-expand")
    element.click
    @@wait.until{@@driver.find_element(:css => "#visitor-nav > div.ng-scope > form > div > ul > li:nth-child(1) > a")}
    @@driver.find_element(:css => "#visitor-nav > div.ng-scope > form > div > ul > li:nth-child(1) > a").click
    @@driver.find_element(:name, 'q').click
    @@driver.find_element(:name, 'q').send_keys(keyWord)
    @@driver.find_element(:name, 'q').send_keys(:return)
    return ResultsPage.new(@@driver)
  end


end