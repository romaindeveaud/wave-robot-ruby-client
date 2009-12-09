$LOAD_PATH.unshift ( 'lib' )

require 'robot_abstract'

class Test < AbstractRobot
  def WAVELET_BLIP_CREATED
  end
end

t = Test.new
puts t.capabilities
