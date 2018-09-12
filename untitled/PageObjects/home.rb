require_relative '../PageObjects/abstractPage'
require_relative '../PageObjects/result'
class HomePage < AbstractPage

  def initialize(driver)
    super(driver)
  end

  def performSearch(keyWord)
    if @@driver.find_element(:css => "button.btn.p-xs-left-right.dropdown-toggle").displayed?
      @@driver.find_element(:css => "button.btn.p-xs-left-right.dropdown-toggle").click
    end
    @@driver.find_element(:css => ".d-lg-flex > div:nth-child(1) > form:nth-child(1) > div:nth-child(3) > div:nth-child(1) > button:nth-child(2)").click
    @@wait.until{@@driver.find_element(:css => "a.ng-binding")}
    @@driver.find_element(:css => ".open > ul:nth-child(3) > li:nth-child(1) > a:nth-child(1)").click
    @@driver.find_element(:css, ".d-lg-flex > div:nth-child(1) > form:nth-child(1) > div:nth-child(3) > input:nth-child(3)").click
    @@driver.find_element(:css, ".d-lg-flex > div:nth-child(1) > form:nth-child(1) > div:nth-child(3) > input:nth-child(3)").send_keys(keyWord)
    @@driver.find_element(:css, ".d-lg-flex > div:nth-child(1) > form:nth-child(1) > div:nth-child(3) > input:nth-child(3)").send_keys(:return)
    return ResultsPage.new(@@driver)
  end


end