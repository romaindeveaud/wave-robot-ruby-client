#!/usr/bin/ruby
# Defines the generic robot classes.
#
# This module provides the Robot class and RobotListener interface,
# as well as some helper functions for web requests and responses.

require 'events'
require 'model'
require 'ops'
require 'json'
require 'util'

class AbstractRobot
#  Robot metadata class.
#
#  This class holds on to basic robot information like the name and profile.
#  It also maintains the list of event handlers and cron jobs and
#  dispatches events to the appropriate handlers.

  @@name = ''
  @@image_url = ''
  @@profile_url = ''
  @@cron_jobs = {}

  def self.set_name(name)
    @@name = name
  end

  def self.set_image_url(url)
    @@image_url = url
  end

  def self.set_profile_url(url)
    @@profile_url = url
  end

  def self.add_cron_job(name, timer)
    @@cron_jobs[name] = timer
  end

  def handled_events
    RUBY_ROBOT_EVENTS.select { |e| self.respond_to?(e) }
  end

  def capabilities
    # Return this robot's capabilities as an XML string.
    lines = ['<w:capabilities>']
    handled_events.each { |e| lines.push "<w:capability name='#{e}'/>" }
    lines.push '</w:capabilities>'
  end
end
