require 'facets'
require_relative '../PageObjects/abstractPage'

class ProfilePage < AbstractPage

  #Create an instance of ProfilePage
  def initialize(driver, data)
    super(driver)
    @info = data
  end

  def getSkillsProfile
    @@driver.find_elements(:css => "img.avatar.avatar-responsive.vertical-align-middle.avatar-lg.m-0")[0].click
    @@wait.until{@@driver.find_element(:css => "div.btn.btn-link.m-0.d-none.d-lg-block.profile-slider-standalone-link")}
    @@wait.until{@@driver.find_elements(:css => "[class='o-tag-skill']")}
    elements = Array.new
    skills = Array.new
    elements = @@driver.find_elements(:css => "[class='o-tag-skill']")
    elements.each do |item|
      skills.push(item.attribute("innerText").strip)
    end
    infoFromResultPage = Array.new
    infoFromResultPage = @info[0]['Skills']
    verifiedInfo = infoFromResultPage & skills
    if verifiedInfo.empty?
      $stderr.puts("the info on the profile page is correctly verified")
    end
    if infoFromResultPage.include? @@configuration['configuration']['keyword']
      $stderr.puts("The info on the result page contains the keyword ")
    end
    $stderr.puts(infoFromResultPage)
    $stderr.puts(skills)
  end


end


