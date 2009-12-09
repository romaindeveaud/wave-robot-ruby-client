#!/usr/bin/ruby
# Defines classes that represent parts of the common wave model.
#
# Defines the core data structures for the common wave model. At this level,
# models are read-only but can be modified through operations.
#
# Note that model attributes break the typical style by providing lower
# camel-cased characters to match the wire protocol format.

require 'logger'
require 'document'

class Wave
# Models a single wave instance.
#
# A single wave is composed of its id and any wavelet ids that belong to it.

  def initialize(json)
# Inits this wave with JSON data.

    @raw_data = JSON.parse json
  end

end

class Wavelet
end

class Blip
end

class Document
end

class Event
end

class Context
end
