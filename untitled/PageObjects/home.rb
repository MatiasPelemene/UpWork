require_relative '../PageObjects/abstractPage'
require_relative '../PageObjects/result'

#HomePage Class, contains the methods to interact with the webelements from home page
class HomePage < AbstractPage

  #Create an instance of HomePage
  def initialize(driver)
    super(driver)
  end

  #perforSearch Performs a search of a freelancer profile

  # Returns an instance of the resultsPage
  def performSearch()
    begin
    @@driver.find_element(:xpath => "/html/body/div[1]/div[2]/div/nav/div/div[2]/div[1]/form/div[3]/div/button[2]").click
    @@driver.find_element(:xpath => "/html/body/div[1]/div[2]/div/nav/div/div[2]/div[1]/form/div[3]/div/ul/li[1]").click
    @@driver.find_element(:xpath => "/html/body/div[1]/div[2]/div/nav/div/div[2]/div[1]/form/div[3]/input[2]").click
    @@driver.find_element(:xpath => "/html/body/div[1]/div[2]/div/nav/div/div[2]/div[1]/form/div[3]/input[2]").send_keys(@@configuration['configuration']['keyword'])
    @@driver.find_element(:xpath => "/html/body/div[1]/div[2]/div/nav/div/div[2]/div[1]/form/div[3]/input[2]").send_keys(:return)
    return ResultsPage.new(@@driver)
    rescue
      puts 'Find Jobs Version'
    end
    @@driver.find_element(:xpath => "/html/body/div[1]/div/nav/div[1]/div[2]/div[1]/div[1]/form/div/div/div[2]/span").click
    @@driver.find_element(:xpath => "/html/body/div[1]/div/nav/div[1]/div[2]/div[1]/div[1]/form/div/ul/li[1]/a").click
    @@driver.find_element(:xpath => "//*[@id='q']").click
    @@driver.find_element(:xpath, "//*[@id='q']").send_keys(@@configuration['configuration']['keyword'])
    @@driver.find_element(:xpath, "//*[@id='q']").send_keys(:return)
    $stderr.puts("Performs a search on the home page")
    return ResultsPage.new(@@driver)
  end


end