$LOAD_PATH.unshift( 'lib' )

require 'robot_abstract'

class Test < AbstractRobot
  def WAVELET_BLIP_CREATED
  end
end

t = Test.new
t.set_name 'Sit !'
t.set_image_url 'http://mon_image.jpg'
puts "\nRobot capabilities : "
puts t.capabilities
puts "\nRobot profile : "
puts t.profile
