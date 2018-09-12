require_relative '../PageObjects/abstractPage'

class ResultsPage < AbstractPage

  def initialize(driver)
    super(driver)
  end

  def getInfoProfiles

    data = Hash.new
    datosPro = Hash.new
    @@wait.until{@@driver.find_element(:css =>".filters-button")}
    @sections= @@driver.find_elements(:css => "[data-qa=freelancer]")
    @sections.each do |section|

      datosPro = {
          "Country" => section.find_element(:css => "strong.d-none.d-md-inline-block").attribute("innerText").strip,
          "Job" => section.find_element(:css => "[data-qa='tile_title']").attribute("innerText").strip
      }
      data.store(section.find_element(:css => "[data-qa='tile_name']").attribute("innerText").strip, datosPro )
      $stderr.puts "hash cargado"
    end





  end



    # data = {}
    #
    # names[] = @@driver.find_element(:css => "a.freelancer-tile-name").get_text
    #
    # b[]= @@driver.find_elements(:css => "section.air-card-hover.air-card-hover-escape.air-card-hover_tile")
    #
    # for(int i = 0;i<b.size();i++){
    # data.put(profesion ,B[i].find_element(selector prof).get_text());
    # data.put(pais ,B[i].find_element(selector pais).get_text());
    # datafinal(B[i].find_element(selector nombre).get_text(),data)
    # Clear(data)
    # }
    # end
    #   end
    #

end