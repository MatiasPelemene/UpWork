require_relative '../PageObjects/abstractPage'
require_relative '../PageObjects/profile'

#ResultsPage Class contains the methods to interact with de results page
class ResultsPage < AbstractPage

  #Create an instance of ResultsPage
  def initialize(driver)
    super(driver)
  end

  #getInfoProfiles retrives the info of profile and creat an structure to handle it.
  def getInfoProfiles
    @data = Hash.new
    @@wait.until{@@driver.find_element(:css =>".filters-button")}
    @sections= @@driver.find_elements(:css => "[data-qa=freelancer]")
      @i=0
    @sections.each do |section|
      datosPro = {
          "Country" => section.find_element(:css => "strong.d-none.d-md-inline-block").attribute("innerText").strip,
          "Title" => section.find_element(:css => "[data-qa='tile_title']").attribute("innerText").strip,
          "Salary" => section.find_element(:css =>"strong[class='pull-left']").attribute("innerText").strip,
          "Skills"=> getSkills(section.find_elements(:css =>("[data-log-label='skill pill']")))
      }
      @data.store(@i, datosPro )
      @i=@i+1
    end
    return @data
  end

  def getSkills(elements)
    @skills = Array.new
    elements.each do |element|
      @skills.push(element.attribute("innerText").strip)
    end
    return @skills
  end

  def verifyInfo
    data = getInfoProfiles
    @skillsV = Array.new
    @flag
    for i in 0..9
      @skillsV = data[i]['Skills']
      @skillsV.each do |value|
        if(value == @@configuration['configuration']['keyword'])
          @flag = true
          break
        else
          @flag = false
        end
      end
      if(@flag)
        $stderr.puts(data[i]['Title'] + " has the keyword! on the skills attribute")
      else
        $stderr.puts(data[i]['Title'] + " hasn't the keyword! on the skills attribute")
      end
    end
    $stderr.puts("Retrive the info from all profiles displayed on the result page y verify if the skills has the keyword in it")
    return ProfilePage.new(@@driver, data)
  end

end