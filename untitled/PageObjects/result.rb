require_relative '../PageObjects/abstractPage'
#ResultsPage Class contains the methods to interact with de results page
class ResultsPage < AbstractPage

  #Create an instance of ResultsPage
  def initialize(driver)
    super(driver)
  end

  #getInfoProfiles retrives the info of profile and creat an structure to handle it.
  def getInfoProfiles
    data = Hash.new
    datosPro = Hash.new

    @@wait.until{@@driver.find_element(:css =>".filters-button")}
    @sections= @@driver.find_elements(:css => "[data-qa=freelancer]")
    @sections.each do |section|

      datosPro = {
          "Country" => section.find_element(:css => "strong.d-none.d-md-inline-block").attribute("innerText").strip,
          "Title" => section.find_element(:css => "[data-qa='tile_title']").attribute("innerText").strip,
          "Salary" => section.find_element(:css =>"strong[class='pull-left']").attribute("innerText").strip,
          "Skills"=> getSkills(section.find_elements(:css =>("[data-log-label='skill pill']")))
      }
      data.store(section.find_element(:css => "[data-qa='tile_name']").attribute("innerText").strip, datosPro )
      $stderr.puts "hash cargado"
    end

  end
  def getSkills(elements)
    skills = Array.new
    elements.each do |element|
      skills.push(element.attribute("innerText").strip)
    end
    return skills
  end




end