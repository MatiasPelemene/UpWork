class ProfilePage < AbstractPage

  #Create an instance of ProfilePage
  def initialize(driver)
    super(driver)
  end

  # def getSkillsProfile
  #   @sections=Array.new
  #   @sections= @@driver.find_elements(:css => "cfe-profile-skills-integration.ng-isolate-scope > div:nth-child(1) > div:nth-child(1) > section:nth-child(2)")
  #
  #   @sections.each do |section|
  #
  #     skillsProfile = {
  #         "Country" => section.find_element(:css => "strong.d-none.d-md-inline-block").attribute("innerText").strip,
  #         "Title" => section.find_element(:css => "[data-qa='tile_title']").attribute("innerText").strip,
  #         "Salary" => section.find_element(:css =>"strong[class='pull-left']").attribute("innerText").strip,
  #         "Skills"=> getSkills(section.find_elements(:css =>("[data-log-label='skill pill']")))
  #     }
  #     data.store(@i, datosPro )
  #
  #
  #   end
  #   return data
  # end
  end


